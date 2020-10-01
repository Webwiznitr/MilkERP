from django.contrib import admin
from .models import Category, Stock, Head_detail

admin.site.register(Category)
admin.site.register(Head_detail)
admin.site.register(Stock)
# Register your models here.
