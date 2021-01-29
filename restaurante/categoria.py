from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from multirestaurante.config import LOGO_BASE32
from django.shortcuts import render, redirect
from multirestaurante.funciones import addUserData,salva_auditoria
from restaurante.forms import CategoriaForm
from restaurante.models import Categoria
from django.http import JsonResponse,HttpResponse
from django.shortcuts import render, redirect
from django.utils.html import strip_tags



@login_required(login_url='/seguridad/login/')
def viewcategoria(request):
    data = {
        'model': 'Categoria',
        'titulo': 'Modulo de Categorias',
        'titulo1': 'Listado de Categorias',
        'titulo2': 'Mantenimiento de Categorias',
        'ruta': '/restaurante/categoria/',
        'user': request.user.username,
        'logo32': LOGO_BASE32
    }
    addUserData(request, data)

    if request.is_ajax():
        if request.GET['action'] == 'elim':
            postar = Categoria.objects.get(id=request.GET['id'])
            nombres= postar.descripcion
            salva_auditoria(request, postar, 'elim',nombres)
            postar.estado = False
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
                      form = CategoriaForm(request.POST)
                      descripcion= request.POST['descripcion']
                      if form.is_valid():
                          form.save()
                          salva_auditoria(request, form.instance, action, descripcion)
                    if action == 'edit':
                      postar = Categoria.objects.get(id=request.POST['id'])
                      form = CategoriaForm(request.POST, instance=postar)
                      descripcion= postar.descripcion
                      if form.is_valid():
                          form.save()
                          salva_auditoria(request, form.instance, action,descripcion)
                    if action == 'elim':
                      postar = Categoria.objects.get(id=request.POST['id'])
                      descripcion= postar.descripcion
                      salva_auditoria(request, postar, action,descripcion)
                      postar.delete()
            except Exception as ex:
                if '"Cannot delete some instances' in str(ex):
                    messages.error(request, 'No se puede eliminar este registro, debido a que esta siendo utilizado por otro!')
                else:
                    messages.error(request, ex)
            return redirect('/restaurante/categoria/')

    else:
        if 'action' in request.GET:
            try:
                action = request.GET['action']
                categoria = Categoria.objects.all()
                data['categoria'] = categoria
                data['action'] = action

                if action == 'add':
                    pass

                if action == 'edit':
                    data['accion'] = 'editar'
                    id =request.GET['id']
                    data['id'] = id
                    categoria = Categoria.objects.get(pk=id)
                    data['descripcion'] = categoria.descripcion
                    data['estado'] = categoria.estado

                if action == 'ver':
                    data['accion'] = 'ver'
                    id =request.GET['id']
                    data['id'] = id
                    categoria = Categoria.objects.get(pk=id)
                    data['descripcion'] = categoria.descripcion
                    data['estado'] = categoria.estado


                return render(request,'categoria/frm_categoria.html',data)

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
                data['categoria'] = Categoria.objects.filter(descripcion__icontains=criterio).order_by('id')
            else:
                data['categoria'] = Categoria.objects.filter(estado=True).order_by('id')

            return render(request, 'categoria/listar_categoria.html', data)

        except Exception as ex:
            if 'That page contains no results' in str(ex):
                return render(request,'categoria/listar_categoria.html',data)
            else:
                messages.error(request, ex)
                return render(request,'categoria/listar_categoria.html',data)
