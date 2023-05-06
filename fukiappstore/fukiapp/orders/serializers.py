from rest_framework import serializers
from .models import Cart
import shops

class CartSerializer(serializers.ModelSerializer):
    product = shops.serializers.ProductSerializer()
    user = shops.serializers.UserSerializer()
    class Meta:
        model = Cart
        fields = ['id', 'product', 'unit_price', 'quantity', 'user']