from multirestaurante import settings
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from multirestaurante.funciones import addUserData
from django.db.models import Q, Sum, Count, Max
import geoip2.database
import time
from django.utils.timezone import activate
activate(settings.TIME_ZONE)
from multirestaurante.config import *
from restaurante.models import *
reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION



@login_required(login_url='/seguridad/login/')
def index(request):
    fecha=time.strftime("%d")
    mes=time.strftime("%m")
    anio = '20'+str(time.strftime("%y"))
    data = {
        'titulo': 'Panel Multirestaurante',
        'saludo': 'Bienvenidos ' + NOMBRE_SISTEMA,
        'titulo1': NOMBRE_INSTITUCION,
        }

    addUserData(request, data)
    return render(request,'seguridad/index.html', data)

