from multirestaurante import settings
from django.shortcuts import render
from django.contrib import messages
from multirestaurante.funciones import *
import time
from django.utils.timezone import activate
from restaurante.models import *
from django.db import transaction
from django.db.models import Q
from django.shortcuts import render, redirect
import json
from django.http import JsonResponse,HttpResponse

activate(settings.TIME_ZONE)
from multirestaurante.config import *

def local(request):
    data = {
        'titulo': 'Multirestaurantes',
        'model': 'sitio',
        'saludo': 'Bienvenidos ' + NOMBRE_SISTEMA,
        'ruta': '/locales/',
        'categorias': Categoria.objects.filter(estado=True)
    }
    addUserData(request, data)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']
            try:
                with transaction.atomic():
                    if action == 'add':
                        pass

            except Exception as ex:
                messages.error(request, ex)
            return redirect('/locales/')

    else:
        if 'action' in request.GET:
            try:
                action = request.GET['action']
                cat = Categoria.objects.all()
                data['categorias'] = cat
                data['action'] = action

                if action == 'valorar':
                    try:
                        if 'id' in request.GET:
                            lo = calificacionlocal.objects.filter(local_id=request.GET['id'],votante=request.user.usuarios).count()
                            if lo == 0:
                                cal = calificacionlocal(local_id=request.GET['id'],calificacion=int(request.GET['valor']),votante=request.user.usuarios)
                                cal.save()
                                response = JsonResponse({'estado':1})
                            else:
                                response = JsonResponse({'estado':2})
                            return HttpResponse(response.content)
                    except Exception as ex:
                        response = JsonResponse({'estado':3})
                        print(ex)
                        return HttpResponse(response.content)

                if action == 'valorareitar':
                    try:
                        if 'id' in request.GET:
                            lo = calificacionlocal.objects.filter(local_id=request.GET['id'],votante=request.user.usuarios).update(calificacion=int(request.GET['valor']))
                            response = JsonResponse({'estado':1})
                            return HttpResponse(response.content)
                    except Exception as ex:
                        response = JsonResponse({'estado':3})
                        print(ex)
                        return HttpResponse(response.content)

                if action == 'ver':
                    data['accion'] = 'ver'
                    id =request.GET['id']
                    data['id'] = id
                    l = Local.objects.get(pk=id)
                    import socket
                    hostname = socket.gethostname()
                    IPAddr = socket.gethostbyname(hostname)
                    count = iplocalvisita.objects.filter(ip=str(IPAddr),local=l).count()
                    totalvotantes = calificacionlocal.objects.filter(local_id=id).count()
                    if totalvotantes != 0:
                        e1 = calificacionlocal.objects.filter(calificacion=1,local_id=id).count()
                        e2 = calificacionlocal.objects.filter(calificacion=2,local_id=id).count()
                        e3 = calificacionlocal.objects.filter(calificacion=3,local_id=id).count()
                        e4 = calificacionlocal.objects.filter(calificacion=4,local_id=id).count()
                        e5 = calificacionlocal.objects.filter(calificacion=5,local_id=id).count()
                        valor_estrellas = (((5*e5)+(4*e4)+(3*e3)+(2*e2)+(1*e1)) / (e5+e4+e3+e2+e1))
                        upd = Local.objects.filter(pk=id).update(valortotal=valor_estrellas)

                    data['localdet'] = Local.objects.get(pk=id)
                    if count == 0:
                        ip = iplocalvisita(local=l,ip=str(IPAddr))
                        ip.save()
                        l.visita = int(l.visita) + 1
                        l.save()
                    if request.user.username != '':
                        cal = calificacionlocal.objects.filter(local_id=id,votante=request.user.usuarios).count()
                        if cal == 1:
                            est = calificacionlocal.objects.get(local_id=id,votante=request.user.usuarios)
                            data['estrellas'] = str(est.calificacion)
                    data['localhor'] = HorarioLocal.objects.filter(local_id=id).filter(estado=True,delete=False).order_by('dia__descripcion')
                    pl = Platos.objects.filter(local_id=id).filter(estado=True,delete=False)
                    cpl = 0
                    for p in pl:
                        if p.oferta == True:
                            cpl = cpl+1

                    if cpl == 0:
                        Local.objects.filter(pk=id).update(oferta=False)
                    else:
                        Local.objects.filter(pk=id).update(oferta=True)


                    data['localplatos'] = Platos.objects.filter(local_id=id).filter(estado=True,delete=False).order_by('-id')
                return render(request,'sitio/local_detalle.html',data)

            except Exception as ex:
                    if 'matching query does not exist' in str(ex):
                        messages.error(request, 'Registro no existe.')
                        return redirect(data['ruta'])
                    else:
                        messages.error(request, ex)
                        return redirect(data['ruta'])

        criterio = ""
        nombre = ""
        if 'criterio' in request.GET:
            criterio = request.GET['criterio']
            data['criterio'] = criterio

        if 'nombre' in request.GET:
            nombre = request.GET['nombre']
            data['nombre'] = nombre


        if criterio and nombre == "":
            local = Local.objects.filter(Q(categoria__descripcion=criterio)|Q(categoria__id=criterio)).filter(estado=True,delete=False).order_by('id')
        elif criterio and nombre:
            local = Local.objects.filter(Q(nombreComercial__icontains=nombre)).filter(Q(categoria__id=criterio)).filter(estado=True,delete=False).order_by('-valortotal')

        else:
            # La primera vez viaje por get: consulta todos los datos
            local= Local.objects.filter(estado=True,delete=False).order_by('-valortotal')
        try:
            # Pagineo
            paging = MiPaginador(local, 10)
            p = 1
            try:
               if 'page' in request.GET:
                  p = int(request.GET['page'])
               page = paging.page(p)
            except:
               page = paging.page(p)

            data['paging'] = paging
            data['rangospaging'] = paging.rangos_paginado(p)
            data['page'] = page
            data['locales'] = page.object_list
            return render(request,'sitio/local.html', data)

        except Exception as ex:
            if 'That page contains no results' in str(ex):
                return render(request,'sitio/local.html',data)
            else:
                messages.error(request, ex)
                return render(request,'sitio/local.html',data)

