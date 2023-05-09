from rest_framework import permissions

class IsCartOwner(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, cart):
        return request.user and request.user == cart.user