from random import choice
from multirestaurante import settings
from django.core import mail
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from django.utils.html import strip_tags
from multirestaurante.funciones import *
from django.db.models import Q
from restaurante.models import Usuarios
from seguridad.models import *
import geoip2.database
import time
from django.utils.timezone import activate
activate(settings.TIME_ZONE)
from django.template.loader import render_to_string
from multirestaurante.config import *

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION
logo = LOGO_BASE32

@login_required(login_url='/seguridad/login/')
def perfil(request):
    data = {
        'model': 'Perfil',
        'titulo': 'Perfil',
        'titulo1': 'PERFIL DE USUARIO',
        'titulo2': 'CAMBIAR CONTRASEÑA',
        'ruta': '/perfil/',
        'user': request.user.username
    }

    addUserData(request, data)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']
            correo = Correo.objects.get(id=1)
            correo_usuario = correo.correo
            try:
                with transaction.atomic():
                    if action == 'duplicado-perfil':
                        c = User.objects.filter(username=request.POST['username']).exclude(pk=request.user.pk).count()
                        if c == 1:
                            username = 'Existe'
                        else:
                            username = 'Dale'
                        response = JsonResponse({'username': username})
                        return HttpResponse(response.content)

                    if action == 'edit':
                        e = Usuarios.objects.get(user__pk=request.POST['id'])
                        u = User.objects.get(pk=e.user.pk)
                        u.username = request.POST['username']
                        u.first_name = request.POST['first_name']
                        u.last_name = request.POST['last_name']
                        u.email = request.POST['email']
                        u.save()
                        e = Usuarios.objects.get(user__pk=request.POST['id'])
                        e.telefono = request.POST['telefono']
                        e.documento = request.POST['documento']
                        e.direccion = request.POST['direccion']
                        e.celular = request.POST['celular']
                        if 'foto' in request.FILES:
                            e.foto = request.FILES['foto']
                        e.save()
                        postar = Usuarios.objects.get(user__pk=request.POST['id'])
                        nombre = postar.user.username
                        salva_auditoria(request, u, action, nombre)

            except Exception as ex:
                    messages.error(request, ex)
            return redirect('/perfil/',data)

    return render(request,'sitio/perfil.html', data)
