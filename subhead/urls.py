from django.urls import path
from . import views
urlpatterns = [
    path(r'', views.dashboard, name = 'headDashboard'),
    path('stocks', views.stocks, name='subhead_stock'),
]

