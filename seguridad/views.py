from multirestaurante import settings
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from multirestaurante.funciones import *
from django.db.models import Q, Sum, Count, Max
from seguridad.models import *
import geoip2.database
import time
from django.utils.timezone import activate
activate(settings.TIME_ZONE)
from multirestaurante.config import *

@login_required(login_url='/seguridad/login/')
def auditoria(request):
    data = {
        'model': 'Auditoria',
        'titulo': 'ACTIVIDAD DE USUARIOS',
        'titulo1': 'Listado de actividades de usuarios',
        'titulo2': 'Auditoria',
        'ruta': '/auditoria',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }
    addUserData(request, data)

    criterio = ""
    desde = ""
    hasta = ""
    if 'criterio' in request.GET:
        criterio = request.GET['criterio']
        data['criterio'] = criterio
    if 'desde' in request.GET:
        desde = request.GET['desde']
        data['desde'] = desde
        data['hasta'] = hasta
        if request.GET['hasta']:
            hasta = request.GET['hasta']
            data['hasta'] = hasta

    if criterio and desde == "" and hasta == "":
        # Entra por criterio de busqueda
        auditoria = AudiUsuarioTabla.objects.filter(Q(usuario__first_name__icontains=criterio) | Q(usuario__last_name__icontains=criterio) | Q(usuario__username__icontains=criterio) |
                                   Q(accion__icontains=criterio) |
                                   Q(tabla__icontains=criterio)).order_by('-id')

    elif desde and hasta == "" and criterio == "":
        auditoria = AudiUsuarioTabla.objects.filter(Q(fecha__icontains=desde)).order_by('-id')

    elif desde == "" and hasta and criterio == "":
        auditoria = AudiUsuarioTabla.objects.filter(Q(fecha__icontains=hasta)).order_by('-id')

    elif desde and hasta == "" and criterio:
        auditoria = AudiUsuarioTabla.objects.filter(Q(fecha__icontains=desde)).filter(Q(usuario__first_name__icontains=criterio) | Q(usuario__last_name__icontains=criterio) | Q(usuario__username__icontains=criterio) |
                                   Q(accion__icontains=criterio) |
                                   Q(tabla__icontains=criterio)).order_by('-id')

    elif desde == "" and hasta and criterio:
        auditoria = AudiUsuarioTabla.objects.filter(Q(fecha__icontains=hasta)).filter(Q(usuario__first_name__icontains=criterio) | Q(usuario__last_name__icontains=criterio) | Q(usuario__username__icontains=criterio) |
                                   Q(accion__icontains=criterio) |
                                   Q(tabla__icontains=criterio)).order_by('-id')

    elif desde and hasta and criterio == "":
        auditoria = AudiUsuarioTabla.objects.filter(Q( fecha__gte=desde,fecha__lte=hasta)).order_by('-id')

    elif desde and hasta and criterio:
        auditoria = AudiUsuarioTabla.objects.filter(Q(fecha__gte=desde,fecha__lte=hasta)).filter(Q(usuario__first_name__icontains=criterio) | Q(usuario__last_name__icontains=criterio) | Q(usuario__username__icontains=criterio) |
                                   Q(accion__icontains=criterio) |
                                   Q(tabla__icontains=criterio)).order_by('-id')

    else:
        hoy = str(datetime.now().date())
        # La primera vez viaje por get: consulta todos los datos
        auditoria = AudiUsuarioTabla.objects.filter(fecha__icontains=hoy).order_by('-id')


    data['auditoria'] = auditoria

    if request.user.is_superuser == True:
        return render(request,'seguridad/auditoria.html', data)
    else:
        return render(request,'page_403.html', data)
