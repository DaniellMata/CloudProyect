from rest_framework import generics, permissions
from django.contrib.auth.models import User
from .models import Tenant, UserProfile
from .serializers import TenantSerializer, UserProfileSerializer

# Registrar nuevo tenant solo con usuarios autenticados
class TenantCreateView(generics.CreateAPIView):
    queryset = Tenant.objects.all()
    serializer_class = TenantSerializer
    permission_classes = [permissions.IsAuthenticated]

# Listar usuarios del tenant actual
class UserListView(generics.ListAPIView):
    serializer_class = UserProfileSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        # Intentamos obtener el tenant del usuario autenticado
        try:
            tenant = user.userprofile.tenant
            return UserProfile.objects.filter(tenant=tenant)
        except UserProfile.DoesNotExist:
            return UserProfile.objects.none()
