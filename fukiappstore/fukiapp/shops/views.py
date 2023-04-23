from rest_framework import viewsets, generics, parsers, permissions, status
from rest_framework.decorators import action
from rest_framework.views import Response
from rest_framework.filters import OrderingFilter
from .models import User, Category, Shop, Product, Comment
from .serializers import (
    UserSerializer, CategorySerializer,
    ShopSerializer, ShopDetailSerializer,
    ProductSerializer, ProductDetailSerializer,
    CommentSerializer
)
from .paginators import ProductPaginator
from .permis import CommentOwner

# Create your views here.
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [parsers.MultiPartParser, ]

    def get_permissions(self):
        if self.action in ['current_user']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]
    @action(methods=['get', 'put'], detail=False, url_path='current-user')
    def current_user(self, request):
        u = request.user
        if request.method.__eq__('PUT'):
            for k, v in request.data.items():
                if k.__eq__('password'):
                    u.set_password(v)
                setattr(u, k, v)
            u.save()
        return Response(UserSerializer(u).data)

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class ShopViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Shop.objects.filter(active=True)
    serializer_class = ShopDetailSerializer
    def get_serializer_class(self):
        if self.action.__eq__('list'):
            return ShopSerializer
        return self.serializer_class

    @action(methods=['get'], detail=True, url_path='products')
    def products(self, request, pk):
        # s = Shop.objects.get(pk=pk)
        s = self.get_object()
        products = s.proshop.filter(active=True)

        kw = self.request.query_params.get('kw')
        if kw:
            products = products.filter(name__icontains=kw)

        return Response(ProductSerializer(products, many=True).data)


class ProductViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductDetailSerializer
    pagination_class = ProductPaginator

    #Sắp xếp tăng giảm
    filter_backends = [OrderingFilter]
    ordering_fields = ['name', 'price']

    def get_serializer_class(self):
        if self.action.__eq__('list'):
            return ProductSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['comments']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]
    def get_queryset(self):
        q = self.queryset

        #Search: keyword
        kw = self.request.query_params.get('kw')
        if kw:
            q = q.filter(name__icontains=kw)

        #Search: shop
        shop_n = self.request.query_params.get('shop_name')
        if shop_n:
            q = q.filter(shop__name__icontains=shop_n)

        #Search:  category
        cate_id = self.request.query_params.get('category_id')
        if cate_id:
            q = q.filter(category_id = cate_id)

        #Search: min_max_price
        min_p = self.request.query_params.get('min_price')
        max_p = self.request.query_params.get('max_price')
        if min_p:
            q = q.filter(price__gte=min_p)
        if max_p:
            q = q.filter(price__lte=max_p)

        return q

    @action(methods=['post'], detail=True, url_path='comments')
    def comments(self, request, pk):
        c = Comment(content=request.data['content'], product=self.get_object(), user=request.user)
        c.save()
        return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)

class CommentViewSet(viewsets.ViewSet, generics.UpdateAPIView, generics.DestroyAPIView, generics.RetrieveAPIView):
    queryset = Comment.objects.filter(active=True)
    serializer_class = CommentSerializer
    # permission_classes = [CommentOwner,]
    def get_permissions(self):
        if self.action in ['update', 'partial_update', 'destroy']:
            return [CommentOwner()]
        if self.action.__eq__('reply_comment'):
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]
    @action(methods=['post'], detail=True, url_path='reply-comment')
    def reply_comment(self, request, pk):
        reply_to = self.get_object()
        c = Comment(content=request.data['content'], product=reply_to.product, user=request.user, reply_to=reply_to)
        c.save()
        return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)
