from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core import mail
from django.db import transaction
from django.db.models import Q
from django.shortcuts import render, redirect
from django.utils.html import strip_tags
from multirestaurante.funciones import addUserData,salva_auditoria
from restaurante.models import *
from seguridad.models import *
from django.contrib.auth.models import User, Group
import geoip2.database
from datetime import timedelta, datetime
import time
#PETICION AJAX
from django.http import JsonResponse,HttpResponse
#Correo2
from multirestaurante.config import LOGO_BASE32
from django.template.loader import render_to_string
from multirestaurante.config import *

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION

@login_required(login_url='/seguridad/login/')
def viewplato(request):
    data = {
        'model': 'Platos',
        'titulo': 'REGISTROS DE PLATOS',
        'titulo1': 'Listado de Platos',
        'titulo2': 'Platos',
        'ruta': '/restaurante/plato/',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }
    addUserData(request, data)

    if request.is_ajax():
        if request.GET['action'] == 'elim':
            postar = Platos.objects.get(id=request.GET['id'])
            nombres= postar.nombre
            salva_auditoria(request, postar, 'elim',nombres)
            postar.delete=True
            postar.save()
            cedula = 'Existe'
            response = JsonResponse({'id': cedula})
            return HttpResponse(response.content)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']
            try:
                with transaction.atomic():
                    if action == 'add':
                        if request.method == 'POST':
                            acticorr = request.POST.get('estado', False)
                            acticofer= request.POST.get('oferta', False)

                            if acticorr == 'on':
                                estado = True
                            else:
                                estado = False
                            if acticofer == 'on':
                                oferta = True
                                Local.objects.filter(pk=int(request.POST['local'])).update(oferta=True)
                            else:
                                oferta = False
                                Local.objects.filter(pk=int(request.POST['local'])).update(oferta=False)


                            e= Platos(local_id=int(request.POST['local']),nombre=request.POST['nombre'],descripcion=request.POST['descripcion'],
                                      descuento= request.POST['descuento'],precio=request.POST['precio'],preciooferta=request.POST['preciooferta'],foto=request.FILES['foto'],
                                      oferta=oferta,estado=estado)
                            e.save()

                        else:
                            messages.error(request,'No se pudo completar esta acción.')
                    if action == 'edit':
                        acticorr = request.POST.get('estado', False)
                        acticofer = request.POST.get('oferta', False)
                        if request.method == 'POST':
                            e = Platos.objects.get(pk=request.POST['id'])
                            e.local_id= request.POST['local']
                            e.nombre= request.POST['nombre']
                            e.descripcion= request.POST['descripcion']
                            e.descuento = request.POST['descuento']
                            e.precio = request.POST['precio']
                            e.preciooferta = request.POST['preciooferta']
                            if 'foto' in request.FILES:
                                e.foto = request.FILES['foto']
                            if acticorr == 'on':
                                e.estado = True
                            else:
                                e.estado = False
                            if acticofer == 'on':
                                e.oferta = True
                                Local.objects.filter(pk=int(request.POST['local'])).update(oferta=True)
                            else:
                                e.oferta = False
                                Local.objects.filter(pk=int(request.POST['local'])).update(oferta=False)


                            e.save()
                        else:
                            messages.error(request,'No se pudo completar esta acción')
                    if action == 'elim':
                      Platos.objects.filter(pk=request.POST['id']).update(estado=False)
                      postar = Platos.objects.get(id=request.POST['id'])
                      nombres= postar.nombre
                      salva_auditoria(request, postar, action,nombres)

            except Exception as ex:
                if '"Cannot delete some instances' in str(ex):
                    messages.error(request, 'No se puede eliminar este registro, debido a que esta siendo utilizado por otro!')
                elif 'duplicate key value violates unique constraint' in str(ex):
                    messages.error(request, 'Plato ya existe')
                else:
                    messages.error(request, ex)
            return redirect('/restaurante/plato/')

    else:
        if 'action' in request.GET:
            try:
                action = request.GET['action']
                plato = Local.objects.filter(propietario=request.user.usuarios,delete=False).order_by('id')
                data['local'] = plato
                data['action'] = action

                if action == 'add':
                    pass
                if action == 'edit':
                    data['accion'] = 'editar'
                    id =request.GET['id']
                    data['id'] = id
                    plato = Platos.objects.get(pk=id)
                    data['foto'] = plato.foto
                    data['nombre'] = plato.nombre
                    data['descripcion'] = plato.descripcion
                    data['descuento'] = int(plato.descuento)
                    data['oferta'] = plato.oferta
                    data['precio'] = plato.precio
                    data['preciooferta'] = plato.preciooferta
                    data['estado'] = plato.estado
                if action == 'ver':
                    data['accion'] = 'ver'
                    id = request.GET['id']
                    data['id'] = id
                    plato = Platos.objects.get(pk=id)
                    data['foto'] = plato.foto
                    data['nombre'] = plato.nombre
                    data['descripcion'] = plato.descripcion
                    data['descuento'] = int(plato.descuento)
                    data['oferta'] = plato.oferta
                    data['precio'] = plato.precio
                    data['preciooferta'] = plato.preciooferta
                    data['estado'] = plato.estado


                return render(request,'plato/frm_platos.html',data)

            except Exception as ex:
                    if 'matching query does not exist' in str(ex):
                        messages.error(request, 'Registro no existe.')
                        return redirect(data['ruta'])
                    else:
                        messages.error(request, ex)
                        return redirect(data['ruta'])

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
            platos = Platos.objects.filter(Q(nombre__icontains=criterio) |
                                               Q(descripcion__icontains=criterio)).filter(local__propietario=request.user.usuarios).filter(delete=False).order_by('id')
        else:
            # La primera vez viaje por get: consulta todos los datos
            platos = Platos.objects.filter(local__propietario=request.user.usuarios).filter(delete=False).order_by('id')
        try:
            data['Platos'] = platos

            return render(request,'plato/listar_platos.html', data)

        except Exception as ex:
            if 'That page contains no results' in str(ex):
                return render(request,'plato/listar_platos.html',data)
            else:
                messages.error(request, ex)
                return render(request,'plato/listar_platos.html',data)