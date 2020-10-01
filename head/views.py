from django.shortcuts import render, redirect
from .models import Category,Stock ,Head_detail
from subhead.models import Subhead_detail
from django.contrib import messages


# Create your views here.
def dashboard(request):
    usr = Head_detail.objects.get(user =request.user)
    return render(request, 'head/dashboard.html',{'user':usr})

def category(request):
    cat = Category.objects.all()
    if request.method =='POST':
        cat_name = request.POST.get('categoryname')
        entry =Category(name = cat_name)
        entry.save()
    return render(request, 'head/category.html',{'category': cat})


def stocks(request):
    cat = Category.objects.all()
    usr = Head_detail.objects.get(user =request.user)
    stk = Stock.objects.filter(head = usr)
    return render(request, 'head/stocks.html',{'category': cat, 'stocks':stk})


def createstock(request):
    usr = Head_detail.objects.get(user =request.user)
    if request.method =='POST':
        s_name = request.POST.get('stockname')
        s_status = request.POST.get('stockstatus')
        cat_id = request.POST.get('category')
        s_quantity = request.POST.get('stocknumber')
        entry =Stock(name = s_name,head=usr, Status =s_status, quantity=s_quantity , category_id=cat_id)
        entry.save()

    return render(request, 'head/createStock.html', {'category':Category.objects.all})


def sendstock(request, id):
    stk = Stock.objects.get(id = id)
    if request.method =='POST':
        squnty = request.POST.get('stocknumber')
        dqunty = int(request.POST.get('distributenumber'))
        str_id    = request.POST.get('stores')
        if 0 < dqunty:
            str = Subhead_detail.objects.get(id =str_id)
            name = stk.name
            cat = stk.category
            status = stk.Status
            if Stock.objects.filter(name = name, sub_head = str).exists():
                obj = Stock.objects.get(name = name, sub_head = str)
                qnty =int( obj.quantity)
                obj.quantity = qnty + dqunty
                obj.save()

            else:
                entry = Stock(name = name, sub_head =str, quantity = dqunty, category=cat, Status =status)
                entry.save()
            stk.quantity = squnty
            stk.save()
        else:
            messages.error(request, 'Enter vaild Quantity')
            return redirect('/head/stock/id')

    print(stk.quantity)
    return render(request, 'head/sendstock.html', {'stock':stk, 'store':Subhead_detail.objects.all})


def profilelist(request):
    data = Subhead_detail.objects.all()
    return render(request, 'head/storeprofile.html', {'user':data})

def storeprofile(request, id):
    data = Subhead_detail.objects.get(id = id)
    stk = Stock.objects.filter(sub_head = data)
    return render(request, 'head/storeprofile2.html',{'user':data, 'stocks':stk})
