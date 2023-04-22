from rest_framework import pagination

class ProductPaginator(pagination.PageNumberPagination):
    page_size = 2

class CategoryPaginator(pagination.PageNumberPagination):
    page_size = 2