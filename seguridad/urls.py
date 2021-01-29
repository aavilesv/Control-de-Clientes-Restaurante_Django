from django.conf.urls import url
from seguridad.login import login_session,logout_user
from seguridad.recuperar_clave import recuperar
from seguridad.clave import clave
from seguridad.usuarios import *

urlpatterns = [
    url(r'^login/', login_session),
    url(r'^logout/', logout_user),
    url(r'^recuperar/', recuperar),
    url(r'^usuarios/$', usuarios),
    url(r'^clave/$', clave),
]

