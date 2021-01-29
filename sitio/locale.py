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
from restaurante.models import Usuarios, Local
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
def locales(request):
    data = {
        'model': 'Locales',
        'titulo': 'Locales',
        'titulo1': 'Locales Registrado',
        'ruta': '/localesusuarios/',
        'locales': Local.objects.filter(propietario=request.user.usuarios,estado=True,delete=False),
        'user': request.user.username
    }

    addUserData(request, data)

    return render(request,'sitio/localesusuarios.html', data)
