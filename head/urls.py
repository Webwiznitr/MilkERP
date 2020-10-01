from django.urls import path
from . import views
urlpatterns = [
    path(r'', views.dashboard, name = 'headDashboard'),
    path('category', views.category, name = 'cate'),
    path('stock', views.stocks, name = 'stocks'),
    path('createstock', views.createstock, name= 'createstock'),
    path('sendstock/<int:id>', views.sendstock, name ='Sendstock'),
    path('storelist', views.profilelist, name = 'storelist'),
    path('storeprofile/<int:id>', views.storeprofile, name='storeProfile'),


]
