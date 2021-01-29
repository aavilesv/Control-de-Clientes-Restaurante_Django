from multirestaurante import settings
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse
from django.shortcuts import render, redirect
import geoip2.database
from django.utils.timezone import activate
activate(settings.TIME_ZONE)
from multirestaurante.config import *
from restaurante.models import *

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION

def login_session(request):
    data = {'titulo': 'Iniciar Sesión'}
    if request.method == 'POST':
        user = authenticate(username=request.POST['usuario'],
                            password=request.POST['password'])
        data['resp'] = False
        if user is not None:
            if Usuarios.objects.filter(user=user).exists():
                emp = Usuarios.objects.get(user=user)
                if emp.user.is_active == True:
                    if user.is_active:
                        Usuarios.objects.filter(user=user).update(ubicacion=request.POST['ip'])
                        login(request, user)
                        data['resp'] = True
                        data['user'] = user.username
                    else:
                        data['error'] = 'Usuario no esta Activo'
                else:
                        data['error'] = 'Cuenta Inactiva'
            else:
                data['error'] = 'Cuenta no existe. Si es un error contactese con un administrador!'
        else:
            data['error'] = 'Credenciales Incorrectas'

        return JsonResponse(data)
    else:
        data['sistema'] = NOMBRE_SISTEMA
        data['institucion'] = NOMBRE_INSTITUCION
        return render(request, 'login.html', data)

def logout_user(request):
    logout(request)
    return redirect('/seguridad/login/')