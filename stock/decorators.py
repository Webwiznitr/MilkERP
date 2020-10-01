from django.shortcuts import HttpResponse , redirect

def authentication(allowed = []):
    def decorator(view_func):
        def wrapper_func(request, *args, **kwargs):
            group = None
            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
                if group == allowed:
                    return view_func(request, *args, **kwargs)
                else:
                    return HttpResponse('you are not authorised for this action1')
            else:
                return HttpResponse('you are not authorised for this action')
        return wrapper_func
    return decorator


def auth(view_func):
    def wrapper_func(request, *args, **kwargs):
        group = None
        if request.user.is_authenticated:
            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
                if group == 'admin':
                    return redirect('/head/')
                elif group == 'subhead':
                    return redirect('/subhead/')
                else:
                    return redirect('/dashboard/logout')
        else:
            return view_func(request, *args, **kwargs)
    return wrapper_func

