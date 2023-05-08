from django.db import models
import shops

# Create your models here.
class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class ItemBase(BaseModel):
    product = models.ForeignKey(shops.models.Product, on_delete=models.RESTRICT)
    quantity = models.IntegerField(default=1)
    unit_price = models.DecimalField(max_digits=10, decimal_places=3)

    class Meta:
        abstract = True


class Cart(models.Model):
    user = models.ForeignKey(shops.models.User, on_delete=models.CASCADE, null=True, blank=True)
    is_completed = models.BooleanField(default=False)
    def __str__(self):
        return self.user.name

class CartItem(ItemBase):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, related_name='items')
    def __str__(self):
        return self.product.name

class PaymentMethod(models.Model):
    name = models.CharField(max_length=100)
    active = models.BooleanField(default=True)
    def __str__(self):
        return self.name

class Order(BaseModel):
    STATUS_CHOICES = [
        ("P", "Pending"),
        ("C", "Completed")
    ]
    name = models.CharField(max_length=255)
    user = models.ForeignKey(shops.models.User, on_delete=models.SET_NULL, null=True, blank=True)
    recipient_name = models.CharField(max_length=255)
    recipient_phone = models.CharField(max_length=10)
    recipient_address = models.CharField(max_length=255)
    total_price = models.DecimalField(max_digits=10, decimal_places=3)
    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.RESTRICT)
    status = models.CharField(max_length=2, choices=STATUS_CHOICES, default='P')
    def __str__(self):
        return self.name

class OrderDetail(ItemBase):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='orderdetails')
    def __str__(self):
        return self.order.name