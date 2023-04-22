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
        extra_kwargs = {
            'password': {'write_only': True}
        }
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ['id', 'name', 'avatar']

class ShopDetailSerializer(ShopSerializer):
    product_count = serializers.SerializerMethodField(read_only=True)
    def get_product_count(self, obj):
        return Product.objects.filter(shop=obj).count()
    class Meta:
        model = ShopSerializer.Meta.model
        fields = ShopSerializer.Meta.fields + ['description', 'created_date', 'product_count']

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'image', 'shop_id']

class ProductDetailSerializer(ProductSerializer):
    category = CategorySerializer()
    shop = ShopSerializer()
    class Meta:
        model = ProductSerializer.Meta.model
        fields = ProductSerializer.Meta.fields + ['description','category', 'shop']

