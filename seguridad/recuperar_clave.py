from random import choice
from multirestaurante import settings
from django.core import mail
from django.contrib.auth import authenticate
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.utils.html import strip_tags
from multirestaurante.funciones import addUserData
from seguridad.models import *
import geoip2.database
import time
from django.utils.timezone import activate
activate(settings.TIME_ZONE)
from django.template.loader import render_to_string
from multirestaurante.config import *

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION

def generarclave():
    longitud = 8
    valores = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    p = ""
    p = p.join([choice(valores) for i in range(longitud)])
    return p

def recuperar(request):
    data = {'titulo1': NOMBRE_INSTITUCION,'titulo': 'Recuperar Clave'}
    data['sistema'] = NOMBRE_SISTEMA
    data['institucion'] = NOMBRE_INSTITUCION
    correo = Correo.objects.get(id=1)
    correo_usuario = correo.correo
    correo_clave = correo.clave

    if request.method == 'POST':
        if 'usuario' in request.POST:
            usuario = request.POST['usuario']
            try:
                user = User.objects.filter(username=usuario)
                us = User.objects.get(username=usuario)
                print(str(us.email))
                print(request.POST['email'])
                with transaction.atomic():
                    if user.exists():
                        if us.is_active:
                            if us.email == request.POST['email']:
                                codigo = generarclave()
                                us.set_password(str(codigo))
                                us.save()
                                ciu = reader.city(str(request.POST['ip']))
                                datos = {
                                    'sucursal': str(empresa),
                                    'usuario': str(us.username),
                                    'codigo': str(codigo),
                                    'fecha': str(time.strftime("%Y-%m-%d %H:%M")),
                                    'estacion':  str(request.POST['ip']),
                                    'ubicacion':  str(ciu.country.name)+" - "+ str(ciu.subdivisions.most_specific.name)+" - "+ str(ciu.city.name),
                                    'correo': str(correo_usuario)
                                }
                                subject = 'CAMBIO DE CONTRASEÑA!'
                                html_message = render_to_string('correo/recuperar.html', datos)
                                plain_message = strip_tags(html_message)
                                from_email =  settings.EMAIL_HOST_USER
                                to = str(us.email)
                                #mail.send_mail(subject,plain_message,from_email,[to],html_message=html_message,fail_silently=True)
                                messages.success(request, 'Clave restaurada, revise su dirección de correo electronico.')
                            else:
                                messages.error(request, 'El correo ingresado, no esta asociado a esta cuenta.')
                        else:
                            messages.error(request, 'Usuario '+ usuario + ' esta deshabilitado.')
                    else:
                        messages.error(request, 'Usuario '+ usuario + ' no existe.')
            except Exception as ex:
                messages.error(request, ex)
            return redirect('/seguridad/login/')
        else:
            return render(request,"recuperar.html",data)
    else:
        return render(request, 'recuperar.html', data)
