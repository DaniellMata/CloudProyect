from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Tenant, UserProfile

class TenantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tenant
        fields = ['id', 'name', 'created_at']

class UserProfileSerializer(serializers.ModelSerializer):
    tenant = serializers.StringRelatedField()
    user = serializers.StringRelatedField()

    class Meta:
        model = UserProfile
        fields = ['id', 'user', 'tenant', 'name', 'email']
