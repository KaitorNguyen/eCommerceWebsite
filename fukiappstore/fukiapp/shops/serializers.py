from rest_framework import serializers
from .models import User, Category, Shop, Product, Review, Comment

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
        fields = ['id', 'name', 'price', 'image']

class ProductDetailSerializer(ProductSerializer):
    category = CategorySerializer()
    shop = ShopSerializer()
    class Meta:
        model = ProductSerializer.Meta.model
        fields = ProductSerializer.Meta.fields + ['description','category', 'shop']

class ReviewSerializer(serializers.ModelSerializer):
    def validate_rate(self, rate):
        if rate < 1 or rate > 5:
            raise serializers.ValidationError('Giá trị rate phải nằm trong khoảng từ 1 đến 5')
        return rate
    class Meta:
        model = Review
        fields = ['id', 'rate', 'content', 'created_date', 'updated_date']

class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    replies = serializers.SerializerMethodField()
    def get_replies(self, obj):
        replies = Comment.objects.filter(reply_to=obj)
        serializer = CommentSerializer(replies, many=True)
        return serializer.data
    class Meta:
        model = Comment
        fields = ['id', 'content', 'created_date', 'user', 'reply_to', 'replies']
