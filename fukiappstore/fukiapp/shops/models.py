from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField

# Create your models here.

class BaseModel(models.Model):
    active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class User(AbstractUser):
    avatar = models.ImageField(upload_to='users/%Y/%m/', null=True)

class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Shop(BaseModel):
    name = models.CharField(max_length=255, unique=True)
    description = RichTextField(null=True)
    user = models.ForeignKey(User, on_delete=models.RESTRICT, related_name='shops')

    def __str__(self):
        return self.name

class Product(BaseModel):
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='products/%Y/%m/', null=True, blank=True)
    description = RichTextField(null=True)
    price = models.DecimalField(max_digits=10, decimal_places=3)
    category = models.ForeignKey(Category, on_delete=models.RESTRICT, related_name='products')
    shop = models.ForeignKey(Shop, on_delete=models.RESTRICT, related_name='proshop')

    def __str__(self):
        return self.name


