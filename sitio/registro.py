import json
import time
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core import mail
from django.core.mail import send_mail
from django.db import transaction
from django.db.models import Q
from django.shortcuts import render, redirect
from django.utils.html import strip_tags
from multirestaurante import settings
from multirestaurante.funciones import addUserData, salva_auditoria, MiPaginador
from django.contrib.auth.models import User, Group
import geoip2.database
from datetime import timedelta, datetime
from django.http import JsonResponse, HttpResponse
from django.template.loader import render_to_string
from multirestaurante.config import *
from restaurante.models import Usuarios, Local
from seguridad.models import *

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION
ruta = 'https://outlook.live.com/'

def registro(request):
    data = {
        'model': 'Usuarios',
        'titulo': 'Listado Usuarios Registrados',
        'titulo1': 'Mantenimiento de Usuarios',
        'ruta': '/registro/',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }

    addUserData(request, data)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']

            try:
                with transaction.atomic():
                    if action == 'ruc':
                        c = Local.objects.filter(documento=request.POST['ruc'],delete=False).count()
                        if c == 1:
                            ruc = 'Existe'
                        else:
                            ruc = 'Dale'
                        response = JsonResponse({'ruc': ruc})
                        return HttpResponse(response.content)
                    if action == 'duplicado':
                        c = User.objects.filter(username=request.POST['username']).count()
                        if c == 1:
                            username = 'Existe'
                        else:
                            username = 'Dale'
                        response = JsonResponse({'username': username})
                        return HttpResponse(response.content)

                    if action == 'duplicado-perfil':
                        c = User.objects.filter(username=request.POST['username']).exclude(pk=request.user.pk).count()
                        if c == 1:
                            username = 'Existe'
                        else:
                            username = 'Dale'
                        response = JsonResponse({'username': username})
                        return HttpResponse(response.content)

                    if action == 'add':
                        if request.method == 'POST':
                            us = User.objects.create_user(username=request.POST['username_new'],
                                                      first_name=request.POST['first_name'],
                                                      last_name=request.POST['last_name'],
                                                      email=request.POST['email'],
                                                      password=request.POST['password_new'],
                                                      is_active=True,is_staff =False,is_superuser=False)
                            grupo = Group.objects.get(name='USUARIO')
                            us.groups.add(grupo)
                            e = Usuarios(user=us,
                                         foto=request.FILES['foto'],
                                         documento=request.POST['documento'],
                                         telefono=request.POST['telefono'],
                                         celular=request.POST['celular'],
                                         direccion=str(request.POST['direccion']))
                            e.save()
                            if request.POST['tipo'] == '0':
                                e.visitante = True
                                e.save()

                            correo = Correo.objects.get(id=1)
                            correo_usuario = correo.correo

                            datos = {
                                 'ruta': str(ruta),
                                 'sucursal': 'MULTIRESTAURANTE',
                                 'codigo': request.POST['password_new'],
                                 'usuario':  request.POST['username_new'],
                                 'correo': str(correo_usuario),
                             }




                            subject = 'Bienvenido, '+ str(us.first_name) + " " + str(us.last_name)
                            html_message = render_to_string('correo/recuperar.html', datos)
                            plain_message = strip_tags(html_message)
                            from_email = settings.EMAIL_HOST_USER
                            to = str(us.email)
                            print(to)
                            print(from_email)
                            print(str(subject))
#                            erroe mail_send
                            #send_mail(subject, plain_message, from_email, [to], html_message=html_message,
                            #          fail_silently=True)
                            #mail.send_mail(subject, plain_message, from_email, [to], html_message=html_message)
                            mensaje = 'Existe'
                            response = JsonResponse({'id': mensaje})
                            return HttpResponse(response.content)

            except Exception as ex:
                if '"Cannot delete some instances' in str(ex):
                    messages.error(request,
                                   'No se puede eliminar este registro, debido a que esta siendo utilizado por otro!')
                elif 'duplicate key value violates unique constraint' in str(ex):
                    messages.error(request, 'Usuario ya existe')
                else:
                    messages.error(request, ex)
            return redirect('/seguridad/usuarios/')

    else:
        return render(request, 'sitio/registro.html', data)
