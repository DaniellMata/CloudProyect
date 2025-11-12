from django.urls import path
from .views import TenantCreateView, UserListView

urlpatterns = [
    path('tenants/', TenantCreateView.as_view(), name='tenant-create'),
    path('users/', UserListView.as_view(), name='user-list'),
]
