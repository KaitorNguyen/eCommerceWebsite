from rest_framework import viewsets, generics, parsers, permissions, status
from rest_framework.decorators import action
from rest_framework.views import Response
from rest_framework.filters import OrderingFilter
from .models import User, Category, Shop, Product, Comment, Review, Notification
from .serializers import (
    UserSerializer, ConfirmUserSerializer,
    CategorySerializer,
    ShopSerializer, ShopDetailSerializer,
    ProductSerializer, CreateProductShopSerializer, ProductDetailSerializer, AuthorizedProductDetailSerializer,
    CommentSerializer, UpdateCommentSerializer,
    ReviewSerializer, NotificationSerializer
)
from .paginators import ProductPaginator
from .permis import CommentOwner, ReviewOwner, IsSellerOrShopOwner, IsSuperAdminOrEmployee
from django.db import IntegrityError
from rest_framework.exceptions import ValidationError
import orders


# Create your views here.
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [parsers.MultiPartParser, ]

    def get_permissions(self):
        if self.action in ['current_user', 'change_password']:
            return [permissions.IsAuthenticated()]
        elif self.action in ['confirm_register', 'confirm']:
            return [IsSuperAdminOrEmployee()]
        elif self.action in ['create_shop', 'shop']:
            return [IsSellerOrShopOwner()]
        return [permissions.AllowAny()]

    @action(methods=['get', 'put'], detail=False, url_path='current-user')
    def current_user(self, request):
        u = request.user
        if request.method.__eq__('PUT'):
            for k, v in request.data.items():
                if k.__eq__('password'):
                    u.set_password(v)
                else:
                    setattr(u, k, v)
            u.save()
        return Response(UserSerializer(u).data)
    @action(methods=['post'], detail=False, url_path='change-password')
    def change_password(self, request):
        u = request.user
        try:
            old_password = request.POST.get('old_password')
            new_password = request.POST.get('new_password')
            if u.check_password(old_password):
                u.set_password(new_password)
                u.save()
                return Response({'message': 'Mật khẩu đã thay đổi thành công.'}, status=status.HTTP_200_OK)
            else:
                return Response({'message': 'Mật khẩu cũ không đúng!!!'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False, url_path='notifications')
    def notifications(self, request):
        notifications = Notification.objects.filter(recipient=request.user.id)
        return Response(NotificationSerializer(notifications, many=True).data)
    @action(methods=['get'], detail=False, url_path='confirm-register')
    def confirm_register(self, request):
        u = User.objects.filter(role='S', is_verified=False)
        return Response(ConfirmUserSerializer(u, many=True).data)
    @action(methods=['patch'], detail=True, url_path='confirm')
    def confirm(self, request, pk):
        # u = request.user
        u = User.objects.get(pk=pk)
        if u.is_verified is False:
            u.is_verified = True
        else:
            return Response({'error': 'Tài khoản này đã xác nhận.'}, status=status.HTTP_400_BAD_REQUEST)
        u.save()
        notice = Notification(sender=request.user.id, content="Đã xác nhận tài khoản {} thành công.".format(u.username),
                              recipient=User.objects.filter(pk=pk).first())
        notice.save()
        return Response(ConfirmUserSerializer(u).data)

    @action(methods=['get'], detail=False, url_path='shop')
    def shop(self, request):
        try:
            s = Shop.objects.filter(user=request.user)
            return Response(ShopSerializer(s, many=True).data, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    # @action(methods=['post'], detail=False, url_path='create-shop')
    # def create_shop(self, request):
    #     name = request.data['name']
    #     avatar = request.data['avatar']
    #     if not avatar:
    #         avatar = "/fukimedia/default/local-store_kj6ybp.png"
    #     if name:
    #         try:
    #             s = Shop(
    #                 name=name,
    #                 description=request.data['description'],
    #                 avatar=avatar,
    #                 user=request.user
    #             )
    #             s.save()
    #         except IntegrityError:
    #             error_msg = 'Tên cửa hàng đã tồn tại !!!'
    #         else:
    #             return Response(ShopDetailSerializer(s).data, status=status.HTTP_201_CREATED)
    #     else:
    #         error_msg = 'Bạn cần phải nhập tên cửa hàng !!!'
    #     return Response({'error': error_msg}, status=status.HTTP_400_BAD_REQUEST)

    #Giỏ hàng
    @action(methods=['get'], detail=False, url_path='cart')
    def cart(self, request):
        u = request.user
        try:
            cart = orders.models.Cart.objects.filter(is_completed=False, user=u).first()
            return Response(orders.serializers.CartSerializer(cart).data)
        except:
            return Response({'error': 'Bạn cần phải đăng nhập!!!'}, status=status.HTTP_400_BAD_REQUEST)

    #Danh sách đơn hàng đã đặt
    @action(methods=['get'], detail=False, url_path='orders')
    def orders(self, request):
        u = request.user
        try:
            o = orders.models.Order.objects.filter(user=u)
            return Response(orders.serializers.OrderBaseSerializer(o, many=True).data)
        except:
            Response({'error': 'Bạn cần phải đăng nhập!!!'}, status=status.HTTP_400_BAD_REQUEST)

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class ShopViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Shop.objects.all()
    serializer_class = ShopDetailSerializer

    def get_serializer_class(self):
        if self.action.__eq__('list'):
            return ShopSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy'] or (self.action in ['products'] and self.request.method == 'POST'):
            return [IsSellerOrShopOwner()]
        return [permissions.AllowAny()]

    def destroy(self, request, *args, **kwargs):
        s = self.get_object()
        products = s.proshop.all()

        if products.exists():
            error_message = "Bạn không thể xóa cửa hàng này do bạn đang có {} sản phẩm.".format(products.count())
            return Response({'error': error_message}, status=status.HTTP_400_BAD_REQUEST)

        self.perform_destroy(s)
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(methods=['get', 'post'], detail=True, url_path='products')
    def products(self, request, pk):
        # s = Shop.objects.get(pk=pk)
        s = self.get_object()
        # products = s.proshop.filter(active=True)
        #
        # kw = self.request.query_params.get('kw')
        # if kw:
        #     products = products.filter(name__icontains=kw)
        if request.method.__eq__('GET'):
            return Response(ShopDetailSerializer(s).data)

        if request.method.__eq__('POST'):
            try:
                data = request.data
                c = Category.objects.get(id=data['category'])
                p = Product(
                    name=data['name'],
                    price=data['price'],
                    image=data['image'],
                    description=data['description'],
                    category=c,
                    shop=s,
                )
                p.save()
            except IntegrityError:
                return Response({'error': 'Sản phẩm đã tồn tại trong cửa hàng.'}, status=status.HTTP_400_BAD_REQUEST)
            except ValidationError as e:
                return Response(e.detail, status=status.HTTP_400_BAD_REQUEST)
            return Response(CreateProductShopSerializer(p).data, status=status.HTTP_201_CREATED)

        # return Response(ProductSerializer(products, many=True).data)


class ProductViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.UpdateAPIView):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductDetailSerializer
    pagination_class = ProductPaginator

    # Sắp xếp tăng giảm
    filter_backends = [OrderingFilter]
    ordering_fields = ['name', 'price']

    def get_serializer_class(self):
        if self.action.__eq__('list'):
            return ProductSerializer
        elif self.action in ['update', 'partial_update']:
            return CreateProductShopSerializer
        elif self.request.user.is_authenticated:
            return AuthorizedProductDetailSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['update', 'partial_update']:
            return [IsSellerOrShopOwner()]
        elif self.action in ['comments', 'reviews'] and self.request.method == 'POST':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    def get_queryset(self):
        q = self.queryset

        # Search: keyword
        kw = self.request.query_params.get('kw')
        if kw:
            q = q.filter(name__icontains=kw)

        # Search: shop
        shop_n = self.request.query_params.get('shop_name')
        if shop_n:
            q = q.filter(shop__name__icontains=shop_n)

        # Search:  category
        cate_id = self.request.query_params.get('category_id')
        if cate_id:
            q = q.filter(category_id=cate_id)

        # Search: min_max_price
        min_p = self.request.query_params.get('min_price')
        max_p = self.request.query_params.get('max_price')
        if min_p:
            q = q.filter(price__gte=min_p)
        if max_p:
            q = q.filter(price__lte=max_p)

        return q
    @action(methods=['get'], detail=False, url_path='compare-product')
    def compare_product(self, request):
        products = self.queryset
        # cate_id = self.request.query_params.get('category_id')
        product1_id = self.request.query_params.get('product1')
        product2_id = self.request.query_params.get('product2')

        # if cate_id:
        #     products = products.filter(category_id=cate_id)

        if product1_id:
            product1 = products.filter(id=product1_id).first()
        else:
            return Response({'error': 'Vui lòng chọn sản phẩm để so sánh!'})

        if product2_id:
            product2 = products.filter(id=product2_id).first()
        else:
            return Response({'product1': ProductDetailSerializer(product1).data,
                             'error': 'Vui lòng chọn sản phẩm thứ 2 để so sánh!'})

        if product1.category.id != product2.category.id:
            return Response({'product1': ProductDetailSerializer(product1).data,
                             'error': 'Sản phẩm thứ 2 phải cùng loại! Vui lòng chọn sản phẩm khác!'})
        else:
            data = {
                'product1': ProductDetailSerializer(product1).data,
                'product2': ProductDetailSerializer(product2).data
            }
            return Response(data)

    @action(methods=['post', 'get'], detail=True, url_path='comments')
    def comments(self, request, pk):
        p = self.get_object()
        comments = p.comment_set.filter(reply_to=None, active=True)
        if request.method.__eq__('POST'):
            c = Comment(content=request.data['content'], product=p, user=request.user)
            c.save()
            return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)
        return Response(CommentSerializer(comments, many=True).data)

    @action(methods=['post', 'get'], detail=True, url_path='reviews')
    def reviews(self, request, pk):
        p = self.get_object()
        reviews = p.review_set.filter(active=True)
        if request.method.__eq__('POST'):
            r, _ = Review.objects.get_or_create(product=p, user=request.user)

            rating = request.data['rate']
            if int(rating) < 0 or int(rating) > 5:
                return Response({'error': 'Giá trị rate phải nằm trong khoảng từ 0 đến 5'}, status=status.HTTP_400_BAD_REQUEST)
            r.rate = rating
            r.content = request.data['content']
            r.save()
            return Response(ReviewSerializer(r).data, status=status.HTTP_201_CREATED)
        return Response(ReviewSerializer(reviews, many=True).data)


class CommentViewSet(viewsets.ViewSet, generics.UpdateAPIView, generics.DestroyAPIView, generics.RetrieveAPIView):
    queryset = Comment.objects.filter(active=True)
    serializer_class = CommentSerializer

    # permission_classes = [CommentOwner,]
    def get_serializer_class(self):
        if self.action in ['update', 'partial_update']:
            return UpdateCommentSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['update', 'partial_update', 'destroy']:
            return [CommentOwner()]
        elif self.action.__eq__('reply_comment'):
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['post'], detail=True, url_path='reply-comment')
    def reply_comment(self, request, pk):
        reply_to = self.get_object()
        c = Comment(content=request.data['content'], product=reply_to.product, user=request.user, reply_to=reply_to)
        c.save()
        return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)


class ReviewViewSet(viewsets.ViewSet, generics.DestroyAPIView):
    queryset = Review.objects.filter(active=True)
    serializer_class = ReviewSerializer

    def get_permissions(self):
        if self.action in ['destroy']:
            return [ReviewOwner()]
        return [permissions.AllowAny()]
