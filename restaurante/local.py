from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.db.models import Q
from django.shortcuts import render, redirect
from multirestaurante.funciones import addUserData,salva_auditoria
from restaurante.models import *
import geoip2.database
from multirestaurante.config import *
import geoip2.database
from django.http import JsonResponse,HttpResponse

reader = geoip2.database.Reader('GeoLite2-City.mmdb')
empresa = NOMBRE_INSTITUCION
ruta= 'https://outlook.live.com/'

@login_required(login_url='/seguridad/login/')
def viewlocal(request):
    data = {
        'model': 'Locales',
        'titulo': 'REGISTROS DE LOCALES',
        'titulo1': 'Listado de Locales',
        'titulo2': 'Local',
        'ruta': '/restaurante/local/',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }
    addUserData(request, data)

    if request.is_ajax():
        if request.GET['action'] == 'elim':
            postar = Local.objects.get(id=request.GET['id'])
            nombres = postar.nombreComercial
            salva_auditoria(request, postar, 'elim', nombres)
            postar.delete = True
            postar.save()
            cedula = 'Existe'
            response = JsonResponse({'id': cedula})
            return HttpResponse(response.content)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']
            try:
                with transaction.atomic():
                    sp = Usuarios.objects.get(user_id=request.user.pk)

                    if action == 'add':
                        if request.method == 'POST':
                            acticorr=  request.POST.get('estado', False)
                            if acticorr == 'on':
                                valor = True
                            else:
                                valor = False

                            ofertar=  request.POST.get('oferta', False)
                            if ofertar == 'on':
                                oferta = True
                            else:
                                oferta = False

                            e= Local(propietario_id=int(sp.pk),
                                     documento=request.POST['documento'],
                                     razonsocial=request.POST['razon'],
                                      nombreComercial= request.POST['nomcomercial'],
                                     descripcion=request.POST['descripcion'],
                                     fotouno=request.FILES['logo'],
                                     fotodos=request.FILES['foto'],
                                     ubicacion=request.POST['ubicacion'],
                                      direccion=request.POST['direccion'],
                                     telefono=request.POST['telefono'],
                                     correo=request.POST['correo'],
                                     categoria_id=int(request.POST['categoria']),
                                     oferta=oferta,
                                     estado=valor)
                            e.save()

                        else:
                            messages.error(request,'No se pudo completar esta acción.')
                    if action == 'edit':
                        if request.method == 'POST':
                            e = Local.objects.get(pk=request.POST['id'])
                            e.propietario_id= int(sp.pk)
                            e.documento= request.POST['documento']
                            e. razonsocial= request.POST['razon']
                            e. nombreComercial = request.POST['nomcomercial']
                            e.descripcion = request.POST['descripcion']
                            if 'logo' in request.FILES:
                                e.fotouno = request.FILES['logo']
                            if 'foto' in request.FILES:
                                e.fotodos = request.FILES['foto']
                            e.direccion=request.POST['direccion']
                            e.ubicacion=request.POST['ubicacion']
                            e.telefono=request.POST['telefono']
                            e.correo = request.POST['correo']
                            e.categoria_id = request.POST['categoria']
                            acticorr = request.POST.get('estado', False)
                            ofertar = request.POST.get('estado', False)
                            if ofertar == 'on':
                                e.oferta = True
                            else:
                                e.oferta = False
                            if acticorr == 'on':
                                e.estado = True
                            else:
                                e.estado = False

                            e.save()

                            nombre = request.POST['nomcomercial']

                            salva_auditoria(request, e, action, nombre)
                        else:
                            messages.error(request,'No se pudo completar esta acción')
                    if action == 'elim':
                      Local.objects.filter(pk=request.POST['id']).update(estado=False)
                      postar = Platos.objects.get(id=request.POST['id'])
                      nombres= postar.nombreComercial
                      salva_auditoria(request, postar, action,nombres)

            except Exception as ex:
                if '"Cannot delete some instances' in str(ex):
                    messages.error(request, 'No se puede eliminar este registro, debido a que esta siendo utilizado por otro!')
                elif 'duplicate key value violates unique constraint' in str(ex):
                    messages.error(request, 'Plato ya existe')
                else:
                    messages.error(request, ex)
            return redirect('/restaurante/local/')

    else:
        if 'action' in request.GET:
            try:
                action = request.GET['action']
                cat = Categoria.objects.all()
                data['categorias'] = cat
                data['action'] = action

                if action == 'add':
                    data['documento'] = request.user.usuarios.documento
                    pass
                if action == 'edit':
                    data['accion'] = 'editar'
                    id =request.GET['id']
                    data['id'] = id
                    local = Local.objects.get(pk=id)
                    data['propietario'] = local.propietario.id
                    data['documento'] = request.user.usuarios.documento
                    data['razon'] = local.razonsocial
                    data['nombreco'] = local.nombreComercial
                    data['descripcion'] = local.descripcion
                    data['logo'] = local.fotouno
                    data['foto'] = local.fotodos
                    data['telefono'] = local.telefono
                    data['direccion'] = local.direccion
                    data['ubicacion'] = local.ubicacion
                    data['correo'] = local.correo
                    data['categoria'] = local.categoria.id
                    data['estado'] = local.estado
                if action == 'ver':
                    data['accion'] = 'ver'
                    id =request.GET['id']
                    data['id'] = id
                    local = Local.objects.get(pk=id)
                    data['propietario'] = local.propietario.id
                    data['documento'] = request.user.usuarios.documento
                    data['direccion'] = local.direccion
                    data['razon'] = local.razonsocial
                    data['nombreco'] = local.nombreComercial
                    data['descripcion'] = local.descripcion
                    data['logo'] = local.fotouno
                    data['foto'] = local.fotodos
                    data['telefono'] = local.telefono
                    data['ubicacion'] = local.ubicacion
                    data['correo'] = local.correo
                    data['categoria'] = local.categoria.id
                    data['estado'] = local.estado


                return render(request,'local/frm_local.html',data)

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
            local = Local.objects.filter(Q(nombreComercial__icontains=criterio) |
                                               Q(documento__icontains=criterio)).filter(propietario=request.user.usuarios).filter(delete=False).order_by('id')
        else:
            # La primera vez viaje por get: consulta todos los datos
            local= Local.objects.filter(propietario=request.user.usuarios).filter(delete=False).order_by('id')
        try:

            data['Local'] = local
            return render(request,'local/listar_local.html', data)

        except Exception as ex:
            if 'That page contains no results' in str(ex):
                return render(request,'local/listar_local.html',data)
            else:
                messages.error(request, ex)
                return render(request,'local/listar_local.html',data)