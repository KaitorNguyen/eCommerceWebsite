from . import views
from rest_framework import routers
from django.urls import path, include

router = routers.DefaultRouter()
router.register('products', views.CartProductViewSet)
router.register('cart', views.CartViewSet)
router.register('orders', views.OrderViewSet)

urlpatterns = [
    path('', include(router.urls)),
]