from rest_framework import serializers
from .models import User, Category, Shop, Product, Review, Comment, Notification
from django.db.models import Avg
from .paginators import ProductPaginator
from django.contrib.auth.models import Group

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ['id', 'name']
class UserSerializer(serializers.ModelSerializer):
    groups = GroupSerializer(many=True, read_only=True)
    def create(self, validated_data):
        data = validated_data.copy()
        u = User(**data)
        u.set_password(u.password)
        if u.role == 'C':
            u.is_verified = True
        elif u.role == 'S':
            u.is_verified = False
        u.save()

        if u.role == 'C':
            g = Group.objects.get(name='Customer')
            u.groups.add(g)
        elif u.role == 'S':
            g = Group.objects.get(name='Seller')
            u.groups.add(g)
            notice = Notification(sender=u.id, content="Đăng kí trở thành nhà bán hàng - {}".format(u.username),
                                  recipient=User.objects.filter(is_superuser=True).first())
            notice.save()
        return u
    class Meta:
        model = User
        fields = ['id', 'username', 'password', 'first_name', 'last_name', 'email', 'avatar', 'role', 'groups']
        extra_kwargs = {
            'password': {'write_only': True},
            'role': {'write_only': True}
        }
class ConfirmUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'role', 'is_verified']
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = ['id', 'name', 'avatar']

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'image']

class CreateProductShopSerializer(ProductSerializer):
    class Meta:
        model = ProductSerializer.Meta.model
        fields = ProductSerializer.Meta.fields + ['description', 'category', 'shop']
        extra_kwargs = {
            'shop': {'read_only': True}
        }

class ShopDetailSerializer(ShopSerializer):
    proshop = ProductSerializer(many=True, read_only=True)
    user = UserSerializer(read_only=True)
    product_count = serializers.SerializerMethodField(read_only=True)
    def get_product_count(self, obj):
        return Product.objects.filter(shop=obj).count()

    def create(self, validated_data):
        requests = self.context.get('request')
        if requests:
            data = validated_data.copy()
            data['user_id'] = requests.user.id
            s = Shop(**data)
            s.save()
            return s
    class Meta:
        model = ShopSerializer.Meta.model
        fields = ShopSerializer.Meta.fields + ['description', 'created_date', 'active', 'user', 'product_count', 'proshop']

class ReviewSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    def validate_rate(self, rate):
        if rate < 1 or rate > 5:
            raise serializers.ValidationError('Giá trị rate phải nằm trong khoảng từ 1 đến 5')
        return rate
    class Meta:
        model = Review
        fields = ['id', 'rate', 'content', 'created_date', 'updated_date', 'user']

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

class UpdateCommentSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    class Meta:
        model = Comment
        fields = ['id', 'content', 'created_date', 'updated_date', 'user']

class ProductDetailSerializer(ProductSerializer):
    category = CategorySerializer()
    shop = ShopSerializer()
    avg_rate = serializers.SerializerMethodField()
    total_review = serializers.SerializerMethodField()
    total_comment = serializers.SerializerMethodField()

    def get_avg_rate(self, product):
        avg_rate = product.review_set.aggregate(Avg('rate'))['rate__avg']
        return int(avg_rate) if avg_rate else 0
    def get_total_review(self, product):
        return product.review_set.count()
    def get_total_comment(self, product):
        return product.comment_set.count()

    class Meta:
        model = ProductSerializer.Meta.model
        fields = ProductSerializer.Meta.fields + ['description', 'category', 'shop', 'avg_rate', 'total_review', 'total_comment']
        extra_kwargs = {
            'avg_rate': {'read_only': True},
            'total_review': {'read_only': True},
            'total_comment': {'read_only': True}
        }

class AuthorizedProductDetailSerializer(ProductDetailSerializer):
    auth_review = serializers.SerializerMethodField()
    def get_auth_review(self, product):
        request = self.context.get('request')
        if request:
            r = product.review_set.filter(user=request.user).first()
            serializer = ReviewSerializer(r)
            return serializer.data

    class Meta:
        model = ProductDetailSerializer.Meta.model
        fields = ProductDetailSerializer.Meta.fields + ['auth_review']

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = '__all__'