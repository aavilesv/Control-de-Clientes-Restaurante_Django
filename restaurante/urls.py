from django.conf.urls import url
from django.urls import path
from restaurante.categoria import *
from restaurante.plato import *
from restaurante.horario import *
from restaurante.local import *


urlpatterns = [
    url(r'^categoria/$',viewcategoria),
    url(r'^plato/$', viewplato),
    url(r'^horario/$', viewhorario),
    url(r'^local/$', viewlocal)

]


