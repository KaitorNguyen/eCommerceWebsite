from . import views
from rest_framework import routers
from django.urls import path, include

router = routers.DefaultRouter()
router.register('users', views.UserViewSet)
router.register('categories', views.CategoryViewSet)
router.register('shops', views.ShopViewSet)
router.register('products', views.ProductViewSet)
router.register('comments', views.CommentViewSet)

urlpatterns = [
    path('', include(router.urls)),
]