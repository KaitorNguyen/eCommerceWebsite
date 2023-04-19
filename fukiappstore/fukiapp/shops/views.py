from rest_framework import viewsets, generics, filters, parsers
from rest_framework.decorators import action
from rest_framework.views import Response
from .models import User,Category, Shop, Product
from .serializers import UserSerializer, CategorySerializer, ShopSerializer, ProductSerializer, ProductDetailSerializer
from .paginators import ProductPaginator

# Create your views here.
class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [parsers.MultiPartParser, ]

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class ShopViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Shop.objects.filter(active=True)
    serializer_class = ShopSerializer

    @action(methods=['get'], detail=True, url_path='products')
    def products(self, request, pk):
        # s = Shop.objects.get(pk=pk)
        s = self.get_object()
        products = s.proshop.filter(active=True)

        kw = self.request.query_params.get('search')
        if kw:
            products = products.filter(name__icontains=kw)

        return Response(ProductSerializer(products, many=True).data)


class ProductViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductSerializer
    pagination_class = ProductPaginator

    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['name', 'price']

    def get_queryset(self):
        q = self.queryset

        #keyword
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

        # #Sắp xếp price_desc_asc
        # sort = self.request.query_params.get('sort_by')
        # if sort=='pricedesc':
        #     q = q.order_by('-price')
        # else:
        #     q = q.order_by('price')
        return q

class ProductDetailViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductDetailSerializer

