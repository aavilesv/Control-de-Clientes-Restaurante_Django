from multirestaurante import settings
from django.shortcuts import render
from multirestaurante.funciones import *
import time
from django.utils.timezone import activate
from restaurante.models import Categoria, Local

activate(settings.TIME_ZONE)
from multirestaurante.config import *

def sitio(request):
    data = {
        'titulo': 'Multirestaurantes',
        'model': 'sitio',
        'saludo': 'Bienvenidos ' + NOMBRE_SISTEMA,
        'locales': Local.objects.filter(estado=True,delete=False).order_by('-valortotal')[:10],
        'categorias': Categoria.objects.filter(estado=True)
    }
    addUserData(request, data)
    return render(request,'sitio/sitio.html',data)