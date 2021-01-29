from datetime import datetime
from django.core.paginator import Paginator
from django.utils.timezone import now
from multirestaurante.config import NOMBRE_SISTEMA
from restaurante.models import Usuarios
from seguridad.models import *


def addUserData(request, data):
    data['hoy'] = now
    data['usuario'] = request.user
    data['sistema'] = NOMBRE_SISTEMA
    data['fecha_tablero'] = str(datetime.now().date())
    data['grupos'] = ModuloGrupo.objects.filter(grupos__in=request.user.groups.all()).order_by('nombre')


class MiPaginador(Paginator):
    def __init__(self, object_list, per_page, orphans=0, allow_empty_first_page=True, rango=5):
        super(MiPaginador, self).__init__(object_list, per_page, orphans=orphans,
                                          allow_empty_first_page=allow_empty_first_page)
        self.rango = rango
        self.paginas = []
        self.primera_pagina = False
        self.ultima_pagina = False

    def rangos_paginado(self, pagina):
        left = pagina - self.rango
        right = pagina + self.rango
        if left < 1:
            left = 1
        if right > self.num_pages:
            right = self.num_pages
        self.paginas = range(left, right + 1)
        self.primera_pagina = True if left > 1 else False
        self.ultima_pagina = True if right < self.num_pages else False
        self.ellipsis_izquierda = left - 1
        self.ellipsis_derecha = right + 1


# Metodo para Salvas en Tablas Auditoras - (Django LogEntry y en AudiUsuarioTabla)
def salva_auditoria(request, model, action,nombre):
    from seguridad.models import AudiUsuarioTabla
    user = request.user
    e = User.objects.get(pk=user.pk)
    e1 = Usuarios.objects.get(user=e)
    client_address = ip_client_address(request)
    # Registro en tabla Auditora BD
    auditusuariotabla = AudiUsuarioTabla(usuario=e,
                                         tabla=model.__class__.__name__,
                                         registroid=model.id,
                                         registroname=nombre,
                                         accion=action,
                                         fecha=datetime.now().date(),
                                         hora=datetime.now().time(),
                                         estacion=e1.ubicacion)
    auditusuariotabla.save()

def ip_client_address(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[-1].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

