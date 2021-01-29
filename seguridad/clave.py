from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db import transaction
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
import datetime
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import time
from multirestaurante.funciones import addUserData

from seguridad.models import Correo
@login_required(login_url='/seguridad/login/')
def clave(request):
    data = {
        'model': 'Perfil',
        'titulo': 'Cambio de Clave',
        'action': 'add'
    }
    addUserData(request, data)

    if request.method == 'POST':
        if 'action' in request.POST:
            action = request.POST['action']
            try:
                with transaction.atomic():
                    if action == 'add':
                      u = User.objects.get(id=request.POST['id'])
                      user = authenticate(username=u.username,
                            password=request.POST['clave_actual'])
                      if user is not None:
                          u.set_password(request.POST['clave'])
                          u.save()
                          messages.success(request,'Clave a sido cambiada con exito.')
                      else:
                          messages.error(request,'Clave actual es incorrecta.')
            except Exception as ex:
                    messages.error(request, ex)
            return redirect('/clave/',data)
    return render(request, 'sitio/clave.html', data)