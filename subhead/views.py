from django.shortcuts import render
from head.models import Category, Stock
from .models import Subhead_detail
# Create your views here.
def dashboard(request):
    usr = Subhead_detail.objects.get(user =request.user)
    return render(request, 'subhead/dashboard.html',{'user':usr})

def stocks(request):
    usr = Subhead_detail.objects.get(user = request.user)
    stk = Stock.objects.filter(sub_head = usr)

    return render(request, 'subhead/stocks.html',{ 'stocks':stk})
