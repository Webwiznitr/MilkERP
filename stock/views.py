from django.shortcuts import render,redirect, HttpResponse
from django.contrib import messages
from django.contrib.auth.models import User, auth
def login(request):
    group = None
    if request.method =='POST':
        uame = request.POST['uname']
        pname = request.POST['pas']
        user = auth.authenticate(username=uame ,password = pname)
        if user is not None:
            auth.login(request, user)
            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
                if group == 'admin':
                    return redirect('/admin/')
                elif group == 'subhead':
                    return redirect('/subhead/')
                else:
                    messages.error(request,'unable to fine group')
                    return redirect('/logout/')

            return HttpResponse('unable to find group')
        else:
            messages.error(request, 'incorrect Username and Password')
            return redirect('/')

    return render(request, 'index.html',{})
