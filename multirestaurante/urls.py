"""multirestaurante URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.views.static import serve
from django.urls import include, path
from multirestaurante.settings import STATIC_ROOT, MEDIA_ROOT
from seguridad.views import auditoria
from sitio.views import *
from seguridad.index import *
from sitio.perfil import *
from seguridad.clave import *
from sitio.registro import *
from sitio.locale import *
from sitio.local import *
from sitio.faq import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',sitio,name='sitio'),
    path('panel/', index,  name='index'),
    path('seguridad/',include('seguridad.urls')),
    path('restaurante/', include('restaurante.urls')),
    path('auditoria/', auditoria),
    path('perfil/', perfil),
    path('localesusuarios/', locales),
    path('locales/', local),
    path('faq/', faq),
    path('clave/', clave),
    path('registro/', registro),
    url(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),
    url(r'^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT})
]

admin.site.site_header = 'ADMINISTRACION MULTIRESTAURANTE'
WKHTMLTOPDF_CMD_OPTIONS = {'encoding': 'utf8', 'quiet': True}