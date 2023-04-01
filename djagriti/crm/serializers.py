from rest_framework import serializers
from cms.models import CmsTeachers


class TeachersSerializer(serializers.ModelSerializer):
    class Meta:
        model = CmsTeachers
        fields = '__all__'
