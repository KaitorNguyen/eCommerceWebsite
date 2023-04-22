from rest_framework import viewsets, generics, parsers, permissions
from rest_framework.decorators import action
from rest_framework.views import Response
from rest_framework.filters import OrderingFilter
from .models import User,Category, Shop, Product
from .serializers import UserSerializer, CategorySerializer, ShopSerializer, ShopDetailSerializer, ProductSerializer, ProductDetailSerializer
from .paginators import CategoryPaginator, ProductPaginator

# Create your views here.
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [parsers.MultiPartParser, ]

    def get_permissions(self):
        if self.action in ['current_user', 'update', 'partial_update']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]
    @action(methods=['get'], detail=False, url_path='current-user')
    def current_user(self, request):
        return Response(UserSerializer(request.user).data)

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    @action(methods=['get'], detail=True, url_path='products')
    def products(self, request, pk):
        c = self.get_object()
        products = c.products.filter(active=True)

        kw = self.request.query_params.get('kw')
        if kw:
            products = products.filter(name__icontains=kw)

        paginator = ProductPaginator()
        page = paginator.paginate_queryset(products, request)

        return paginator.get_paginated_response(ProductSerializer(page, many=True).data)

class ShopViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Shop.objects.filter(active=True)
    serializer_class = ShopDetailSerializer
    def get_serializer_class(self):
        if self.action.__eq__('list'):
            return ShopSerializer
        return super().get_serializer_class()

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
        return super().get_serializer_class()
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

        #Search: min_max_price
        min_p = self.request.query_params.get('min_price')
        max_p = self.request.query_params.get('max_price')
        if min_p:
            q = q.filter(price__gte=min_p)
        if max_p:
            q = q.filter(price__lte=max_p)

        return q


