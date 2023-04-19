from django.contrib import admin
from .models import User, Category, Shop, Product
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.utils.html import mark_safe

#Tùy chỉnh trang admin

class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'first_name', 'last_name', 'is_staff']

    class Meta:
        model = User
        fields = '__all__'
class ShopForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Shop
        fields = '__all__'
class ShopAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'description']
    search_fields = ['name', 'description']
    form = ShopForm

class ProductForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Product
        fields = '__all__'

class ProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'category', 'shop', 'image']
    search_fields = ['name']
    list_filter = ['category', 'shop']
    form = ProductForm
    readonly_fields = ['avatar']

    def avatar(self, product):
        return mark_safe("<img src='/static/{}' width='120' >".format(product.image.name))


# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Category)
admin.site.register(Shop, ShopAdmin)
admin.site.register(Product, ProductAdmin)
