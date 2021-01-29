from django.db import models
from django.contrib.auth.models import User, Group
from django.template.defaulttags import now

class Modulo(models.Model):
    url = models.CharField(max_length=100)
    nombre = models.CharField(max_length=100)
    icono = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=100)
    activo = models.BooleanField(default=True)
    orden = models.IntegerField(default=0)

    def __str__(self):
        return '{} ({})'.format(self.nombre, self.url)

    class Meta:
        verbose_name = 'Módulo'
        verbose_name_plural = 'Módulos'
        ordering = ['orden']

class ModuloGrupo(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200, blank=True)
    icono = models.CharField(max_length=100)
    modulos = models.ManyToManyField(Modulo)
    grupos = models.ManyToManyField(Group)
    prioridad = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return '{} {}'.format(self.nombre, self.prioridad)

    class Meta:
        verbose_name = 'Grupo de Módulos'
        verbose_name_plural = 'Grupos de Módulos'
        ordering = ('prioridad', 'nombre')

    def modulos_activos(self):
        return self.modulos.filter(activo=True).order_by('nombre')

class AudiUsuarioTabla(models.Model):
    TIPOS_ACCIONES = (
        ('A', 'A'),   # Adicion
        ('M', 'M'),   # Modificacion
        ('E', 'E')    # Eliminacion
    )
    usuario = models.ForeignKey(User,on_delete=models.PROTECT, verbose_name='Usuario')
    tabla = models.CharField(max_length=100, verbose_name='Tabla')
    registroid = models.IntegerField(verbose_name='Registro Id')
    registroname = models.CharField(max_length=100,verbose_name='Registro Name')
    accion = models.CharField(choices=TIPOS_ACCIONES, max_length=10, verbose_name='Accion')
    fecha = models.DateField(verbose_name='Fecha')
    hora = models.TimeField(verbose_name='Hora')
    estacion = models.CharField(max_length=100, verbose_name='Estacion')

    def save(self, force_insert=False, force_update=False, using=None, **kwargs):
        self.registroname = self.registroname.upper()
        super(AudiUsuarioTabla, self).save(force_insert, force_update, using)


    def __str__(self):
        return "{} - {} [{}]".format(self.usuario.username, self.tabla, self.accion)

    class Meta:
        verbose_name = 'Auditoria Usuario '
        verbose_name_plural = 'Auditorias Usuarios'
        ordering = ('-fecha', 'hora')

class Correo(models.Model):
    correo = models.CharField(max_length=100)
    clave = models.CharField(max_length=100)

