from rest_framework import viewsets, generics, status, permissions
from rest_framework.decorators import action
from rest_framework.views import Response
from .models import Cart, CartItem, Order, OrderDetail, PaymentMethod
import shops
from .serializers import CartItemSerializer, CartSerializer, OrderSerializer
import random

# Create your views here.
class CartProductViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = shops.models.Product.objects.filter(active=True)
    serializer_class = CartItemSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=True, url_path='add-to-cart')
    def add_to_cart(self, request, pk):
        user = request.user
        # if not user.pk:
        #     user = None
        try:
            cart, _ = Cart.objects.get_or_create(user=user, is_completed=False)

            p = self.get_object()
            cart_item, created = CartItem.objects.get_or_create(cart=cart, product=p, unit_price=p.price)
            if not created:
                cart_item.quantity += 1
            cart_item.save()
        except:
            return Response({'error': 'Bạn cần phải đăng nhập!!!'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(CartItemSerializer(cart_item).data, status=status.HTTP_201_CREATED)
    @action(methods=['delete', 'patch'], detail=True, url_path='remove-cart')
    def remove_cart(self, request, pk):
        p = self.get_object()
        cart = Cart.objects.filter(user=request.user, is_completed=False).first()
        item = CartItem.objects.filter(cart=cart, product=p).first()

        if request.method.__eq__('PATCH'):
            item.quantity -= 1
            if item.quantity < 1:
                item.delete()
                return Response({'error': 'Sản phẩm {} đã bị xóa khỏi giỏ hàng.'.format(p.name)},
                                status=status.HTTP_204_NO_CONTENT)
            item.save()
            return Response(CartItemSerializer(item).data, status=status.HTTP_200_OK)
        if request.method.__eq__('DELETE'):
            item.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

class CartViewSet(viewsets.ViewSet, generics.DestroyAPIView):
    queryset = Cart.objects.filter(is_completed=False)
    serializer_class = CartSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=True, url_path='check-out')
    def check_out(self, request, pk):
        cart = self.get_object()
        payment_method = PaymentMethod.objects.get(id=request.data['payment_method'], active=True)
        cart_items = CartItem.objects.filter(cart=cart)

        try:
            order = Order(
                name='HD{}'.format(random.randint(1, 100000)),
                recipient_name=request.data['recipient_name'],
                recipient_phone=request.data['recipient_phone'],
                recipient_address=request.data['recipient_address'],
                total_price=sum(item.quantity * item.unit_price for item in cart_items),
                payment_method=payment_method,
                user=request.user
            )
            if order.payment_method != PaymentMethod.objects.get(name='Trực tiếp'):
                order.status = 'C'
            order.save()
            for item in cart_items:
                order_data = OrderDetail(
                    order=order,
                    product=item.product,
                    quantity=item.quantity,
                    unit_price=item.unit_price
                )
                order_data.save()
            cart.is_completed = True
            cart.save()
            return Response(OrderSerializer(order).data, status=status.HTTP_201_CREATED)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class OrderViewSet(viewsets.ViewSet, generics.RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated]