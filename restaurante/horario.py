from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.db.models import Q
from django.shortcuts import render, redirect
from multirestaurante.funciones import addUserData, salva_auditoria
from restaurante.forms import HorarioForm
from restaurante.models import *
from multirestaurante.config import LOGO_BASE32
from datetime import timedelta, datetime
import geoip2.database
from django.http import JsonResponse,HttpResponse

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
@login_required(login_url='/seguridad/login/')
def viewhorario(request):
    data = {
        'model': 'Horario',
        'titulo': 'Modulo Horarios',
        'titulo1': 'Listado de Horarios',
        'titulo2': 'Mantenimiento de Horarios',
        'ruta': '/restaurante/horario/',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }

    addUserData(request, data)

    if request.is_ajax():
        if request.GET['action'] == 'elim':
            postar = HorarioLocal.objects.get(id=request.GET['id'])
            nombres= postar.dia.descripcion
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
                        acticorr = request.POST.get('estado', False)
                        if acticorr == 'on':
                            valor = True
                        else:
                            valor = False
                        if request.method == 'POST':
                            e = HorarioLocal(local_id=int(request.POST['local']), dia_id=request.POST['dia'],
                                       horaInicio=request.POST['horainic'],
                                       horaFin=request.POST['horafin'],estado=valor)
                        e.save()

                    if action == 'edit':
                        if request.method == 'POST':
                            e = HorarioLocal.objects.get(pk=request.POST['id'])
                            e.local_id = int(request.POST['local'])
                            e.dia_id = int(request.POST['dia'])
                            e.horaInicio = request.POST['horainic']
                            e.horaFin = request.POST['horafin']
                            acticorr = request.POST.get('estado', False)
                            if acticorr == 'on':
                                e.estado = True
                            else:
                                e.estado = False

                            e.save()

                    if action == 'elim':
                      e = HorarioLocal.objects.get(pk=request.POST['id'])
                      e.delete=  True
                      e.save()
                      id = request.POST['id']
                      salva_auditoria(request, e, action,id)

            except Exception as ex:
                if '"Cannot delete some instances' in str(ex):
                    messages.error(request, 'No se puede eliminar este registro, debido a que esta siendo utilizado por otro!')
                else:
                    messages.error(request, ex)
            return redirect('/restaurante/horario/')

    else:
        # Entra por Get
        # Si se presiona nuevo, editar o eliminar se llama por get al formulario de mantenimientos
        # por la tanto existe el name action con el valor de (add,edit,delete) caso contario llama al listado
        if 'action' in request.GET:
            try:
                action = request.GET['action']
                data['action'] = action
                plato =Local.objects.filter(propietario=request.user.usuarios).order_by('id')
                data['local'] = plato
                dia = Dias.objects.all().order_by('descripcion')
                data['dias'] = dia

                if action == 'add':
                    pass

                if action == 'edit':

                    data['accion'] = 'editar'
                    id =request.GET['id']
                    data['id'] = id
                    h = HorarioLocal.objects.get(pk=id)
                    data['idlocal'] = h.local.id
                    data['iddia'] = h.dia.id
                    data['horainic'] = h.horaInicio
                    data['horafin'] = h.horaFin
                    data['estado'] = h.estado

                if action == 'ver':
                    data['accion'] = 'ver'
                    id = request.GET['id']
                    data['id']=id
                    h = HorarioLocal.objects.get(pk=id)
                    data['idlocal'] = h.local.id
                    data['iddia'] = h.dia.id
                    data['horainic'] = h.horaInicio
                    data['horafin'] = h.horaFin
                    data['estado'] = h.estado



                return render(request,'horario/frm_horario.html',data)
            except Exception as ex:
                    if 'matching query does not exist' in str(ex):
                        messages.error(request, 'Registro no existe.')
                        return redirect(data['ruta'])
                    else:
                        messages.error(request, ex)
                        return redirect(data['ruta'])


        try:
            if 'criterio' in request.GET:
                criterio = request.GET['criterio']
                data['criterio'] = criterio
                data['horario'] = HorarioLocal.objects.filter(dia__descripcion__icontains=criterio).filter(delete=False)\
                    .filter(local__propietario=request.user.usuarios).order_by('local')
            else:
                data['horario']=HorarioLocal.objects.filter(local__propietario=request.user.usuarios).filter(delete=False).order_by('local')
            return render(request, 'horario/listar_horario.html', data)
        except Exception as ex:
            if 'That page contains no results' in str(ex):
                return render(request,'horario/listar_horario.html',data)
            else:
                messages.error(request, ex)
                return render(request,'horario/listar_horario.html',data)
