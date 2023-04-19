from rest_framework import serializers
from .models import User, Category, Shop, Product

class UserSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        data = validated_data.copy()
        u = User(**data)
        u.set_password(u.password)
        u.save()
        return u

    class Meta:
        model = User
        fields = ['id', 'username', 'password', 'first_name', 'last_name', 'email', 'avatar']
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ['id', 'name', 'description', 'created_date']

class ProductSerializer(serializers.ModelSerializer):
    shop = ShopSerializer()
    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'image', 'shop']

class ProductDetailSerializer(ProductSerializer):
    category = CategorySerializer()
    class Meta:
        model = ProductSerializer.Meta.model
        fields = ProductSerializer.Meta.fields + ['description','category']

