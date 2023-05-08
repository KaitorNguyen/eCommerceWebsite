from rest_framework import serializers
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
    total_price = serializers.SerializerMethodField()

    def get_total_price(self, cart):
        items = CartItem.objects.filter(cart=cart)
        total_price = 0
        for item in items:
            total_price += item.quantity * item.unit_price
        return total_price
    class Meta:
        model = Cart
        fields = ['id', 'user_id', 'is_completed', 'items', 'total_price']

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