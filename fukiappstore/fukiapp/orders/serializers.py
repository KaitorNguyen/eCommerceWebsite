from rest_framework import serializers
from django.db.models import Sum
from .models import Cart, CartItem, Order, OrderDetail, PaymentMethod
import shops

class CartItemSerializer(serializers.ModelSerializer):
    product = shops.serializers.ProductSerializer()
    total_item_price = serializers.SerializerMethodField()

    def get_total_item_price(self, cartitem):
        return cartitem.unit_price * cartitem.quantity
    class Meta:
        model = CartItem
        fields = ['id', 'product', 'unit_price', 'quantity', 'total_item_price']

class CartSerializer(serializers.ModelSerializer):
    items = CartItemSerializer(many=True, read_only=True)
    total_product = serializers.SerializerMethodField()
    total_price = serializers.SerializerMethodField()

    def get_total_product(self, cart):
        c = CartItem.objects.filter(cart=cart)
        q = c.aggregate(Sum('quantity'))['quantity__sum']
        return q

    def get_total_price(self, cart):
        items = CartItem.objects.filter(cart=cart)
        total_price = 0
        for item in items:
            total_price += item.quantity * item.unit_price
        return total_price
    class Meta:
        model = Cart
        fields = ['id', 'user_id', 'is_completed', 'items', 'total_product', 'total_price']

class PaymentMethodSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaymentMethod
        fields = '__all__'
class OrderDetailSerializer(serializers.ModelSerializer):
    product = shops.serializers.ProductSerializer()
    total_item_price = serializers.SerializerMethodField()

    def get_total_item_price(self, orderdetail):
        return orderdetail.unit_price * orderdetail.quantity
    class Meta:
        model = OrderDetail
        fields = ['id', 'order_id', 'product', 'unit_price', 'quantity', 'total_item_price']


class OrderBaseSerializer(serializers.ModelSerializer):
    payment_method = PaymentMethodSerializer()
    class Meta:
        model = Order
        fields = ['id', 'name', 'payment_method', 'status']
class OrderSerializer(OrderBaseSerializer):
    orderdetails = OrderDetailSerializer(many=True, read_only=True)
    class Meta:
        model = OrderBaseSerializer.Meta.model
        fields = OrderBaseSerializer.Meta.fields + ['recipient_name', 'recipient_phone', 'recipient_address',
                                                    'total_price', 'orderdetails']

# #Thống kê
# class StatisProductSerializer(serializers.ModelSerializer):
#     sold_product = serializers.SerializerMethodField(read_only=True)
#     revenue = serializers.SerializerMethodField(read_only=True)
#     def get_sold_product(self, product):
#         # Product.objects.annotate(count=Sum('orderdetail__quantity'))
#         order_pro = OrderDetail.objects.filter(product=product)
#         quantity = order_pro.aggregate(quant_sum=Sum('quantity'))
#         return quantity['quant_sum'] if quantity else 0
#
#     def get_revenue(self, product):
#         order_pro = OrderDetail.objects.filter(product=product)
#         quantity = order_pro.aggregate(Sum('quantity'))['quantity__sum']
#         return quantity * product.price if quantity else 0
#     class Meta:
#         model = shops.models.Product
#         fields = ['id', 'name', 'price', 'sold_product', 'revenue', 'shop_id']
# class StatisShopSerializer(serializers.ModelSerializer):
#     total_product = serializers.SerializerMethodField(read_only=True)
#     total_revenue = serializers.SerializerMethodField(read_only=True)
#     proshop = StatisProductSerializer(many=True, read_only=True)
#
#     #Sản phẩm trong cửa hàng
#     def get_total_product(self, obj):
#         return shops.models.Product.objects.filter(shop=obj).count()
#
#     #Tổng doanh thu
#     def get_total_revenue(self, shop):
#         products = shop.proshop.all()
#         total = 0
#         for p in products:
#             quantity_sold = shops.models.Product.objects.filter(id=p.id).annotate(sum=Sum('orderdetail__quantity'))
#             total_price_sold = quantity_sold[0].sum * p.price if quantity_sold[0].sum else 0
#             total += total_price_sold
#         return total
#
#     class Meta:
#         model = shops.models.Shop
#         fields = ['id', 'name', 'total_product', 'total_revenue', 'proshop']

#Thống kê
class StatisProductSerializer(serializers.ModelSerializer):
    sold_product = serializers.SerializerMethodField(read_only=True)
    revenue = serializers.SerializerMethodField(read_only=True)
    def get_sold_product(self, product):
        # Product.objects.annotate(count=Sum('orderdetail__quantity'))
        # order_pro = OrderDetail.objects.filter(product=product)
        # quantity = order_pro.aggregate(quant_sum=Sum('quantity'))
        orders = Order.objects.filter(status='C')
        for order in orders:
            order_pro = OrderDetail.objects.filter(product=product, order=order)
            quantity = order_pro.aggregate(quant_sum=Sum('quantity'))
            return quantity['quant_sum'] if quantity['quant_sum'] else 0

    def get_revenue(self, product):
        # order_pro = OrderDetail.objects.filter(product=product)
        # quantity = order_pro.aggregate(Sum('quantity'))['quantity__sum']
        orders = Order.objects.filter(status='C')
        for order in orders:
            order_pro = OrderDetail.objects.filter(product=product, order=order)
            quantity = order_pro.aggregate(Sum('quantity'))['quantity__sum']
            return quantity * product.price if quantity else 0
    class Meta:
        model = shops.models.Product
        fields = ['id', 'name', 'price', 'sold_product', 'revenue', 'shop_id']
class StatisShopSerializer(serializers.ModelSerializer):
    total_product = serializers.SerializerMethodField(read_only=True)
    total_revenue = serializers.SerializerMethodField(read_only=True)
    proshop = StatisProductSerializer(many=True, read_only=True)

    #Sản phẩm trong cửa hàng
    def get_total_product(self, obj):
        return shops.models.Product.objects.filter(shop=obj).count()

    #Tổng doanh thu
    def get_total_revenue(self, shop):
        products = shop.proshop.all()
        total = 0
        orders = Order.objects.filter(status='C')
        for order in orders:
            for p in products:
                quantity_sold = OrderDetail.objects.filter(order=order, product=p).aggregate(Sum('quantity'))['quantity__sum']
                total_price_sold = quantity_sold * p.price if quantity_sold else 0
                # quantity_sold = shops.models.Product.objects.filter(id=p.id).annotate(sum=Sum('orderdetail__quantity'))
                # total_price_sold = quantity_sold[0].sum * p.price if quantity_sold[0].sum else 0
                total += total_price_sold
        return total

    class Meta:
        model = shops.models.Shop
        fields = ['id', 'name', 'total_product', 'total_revenue', 'proshop']