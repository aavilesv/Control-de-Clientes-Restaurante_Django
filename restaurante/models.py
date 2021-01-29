from decimal import Decimal
from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone
OBLIGADO, NATURAL, ESPECIAL = 'OBLIGADO A LLEVAR CONTABILIDAD', 'CONTRIBUYENTE NATURAL', 'CONTRIBUYENTE ESPECIAL'

class Dias (models.Model):
    descripcion = models.CharField(max_length=400)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return '{}'.format(self.descripcion)

    class Meta:
        verbose_name = 'Dias'
        verbose_name_plural = 'Dias'
        ordering = ('descripcion',)


class Usuarios(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, unique=True)
    documento = models.CharField(max_length=20, default='')
    celular = models.CharField(max_length=20, default='')
    telefono = models.CharField(max_length=20, default='')
    direccion = models.CharField(max_length=200, default='')
    ubicacion = models.CharField(max_length=100, blank=True, null=True)
    foto = models.ImageField(upload_to='usuarios/', blank=True, null=True)
    visitante =  models.BooleanField(default=False)

    def __str__(self):
        return "{} {} | {}".format(self.user.first_name, self.user.last_name, self.documento)

    def datos(self):
        return "{} {}".format(self.user.first_name, self.user.last_name)

    class Meta:
        verbose_name = 'Propietario'
        verbose_name_plural = "Propietarios"
        ordering = ('documento',)


class Categoria (models.Model):
    descripcion = models.CharField(max_length=400)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return '{}'.format(self.descripcion)

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'
        ordering = ('descripcion',)

class Local(models.Model):
    propietario = models.ForeignKey(Usuarios, blank=True, null=True, verbose_name="Propietario", on_delete=models.PROTECT)
    documento = models.CharField(max_length=50, blank=True, default='', verbose_name='Ruc')
    razonsocial = models.CharField(max_length=200, blank=True, null=True, verbose_name='Razón Social')
    nombreComercial = models.CharField(max_length=200, blank=True, null=True, verbose_name='Nombre Comercial')
    fotouno = models.ImageField(upload_to='local/%Y/%m', null=True, blank=True, verbose_name='Logo Comercial')
    fotodos = models.ImageField(upload_to='local/%Y/%m', null=True, blank=True, verbose_name='Foto Local')
    direccion = models.CharField(max_length=500, blank=True, null=True, verbose_name='Dirección')
    telefono = models.CharField(max_length=500, blank=True, null=True, verbose_name='telefono')
    correo = models.EmailField(max_length=150, blank=True, null=True, verbose_name='Correo')
    categoria = models.ForeignKey(Categoria, blank=True, null=True, verbose_name="Categoria", on_delete=models.PROTECT)
    descripcion = models.CharField(max_length=2500, blank=True, null=True, verbose_name='Descripcion')
    visita = models.IntegerField(default=0, verbose_name='Visita')
    valortotal = models.FloatField(default=0, blank=True, null=True)
    oferta = models.BooleanField(default=False, verbose_name='Oferta')
    estado = models.BooleanField(default=True)
    delete = models.BooleanField(default=False)
    ubicacion = models.CharField(max_length=1000, blank=True, default='', verbose_name='Ubicacion')

    def __str__(self):
        return '{}, {}, {}'.format(self.documento, self.razonsocial, self.nombreComercial)

    class Meta:
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'
        ordering = ('documento',)

class iplocalvisita(models.Model):
    local = models.ForeignKey(Local, blank=True, null=True, verbose_name="Local", on_delete=models.PROTECT)
    ip = models.CharField(max_length=200, blank=True, null=True, verbose_name='Ip')


    def __str__(self):
        return '{}, {}'.format(self.ip, self.local.nombreComercial)

class calificacionlocal(models.Model):
    local = models.ForeignKey(Local, blank=True, null=True, verbose_name="Local", on_delete=models.PROTECT)
    calificacion = models.IntegerField(default=0, blank=True, null=True, verbose_name='Valor')
    votante = models.ForeignKey(Usuarios, blank=True, null=True, verbose_name="Votante", on_delete=models.PROTECT)


    def __str__(self):
        return '{}, {}'.format(self.calificacion, self.local.nombreComercial)



class Faq(models.Model):
    pregunta = models.CharField(max_length=1050, blank=True, default='', verbose_name='Pregunta')
    respuesta = models.CharField(max_length=1200, blank=True, null=True, verbose_name='Respuesta')
    estado = models.BooleanField(default=True)

    def __str__(self):
        return '{}'.format(self.pregunta)

    class Meta:
        verbose_name = 'Faq'
        verbose_name_plural = 'Faq'
        ordering = ('pregunta',)

class HorarioLocal(models.Model):
    local = models.ForeignKey(Local, blank=True, null=True, verbose_name="Local", on_delete=models.PROTECT)
    dia = models.ForeignKey(Dias, blank=True, null=True, verbose_name="Dia", on_delete=models.PROTECT)
    horaInicio = models.TimeField(default=timezone.now,verbose_name='Hora de apertura')
    horaFin = models.TimeField(default=timezone.now, verbose_name='Hora de cierre')
    estado = models.BooleanField(default=True)
    delete= models.BooleanField(default=False)

    def __str__(self):
        return "{}, {}: {} - {}".format(self.local.nombreComercial, self.dia, self.horaInicio, self.horaFin)


    class Meta:
        verbose_name = "Horario de Atención"
        verbose_name_plural = "Horarios de Atención"
        ordering = ('local',)


class Platos(models.Model):
    local=models.ForeignKey(Local, blank=True, null=True, verbose_name="Restaurante", on_delete=models.PROTECT)
    nombre = models.CharField(max_length=200, default='')
    descripcion = models.CharField(max_length=200, default='')
    descuento = models.IntegerField( default=0)
    precio = models.DecimalField(max_digits=11, decimal_places=2, default=Decimal('0.00'))
    preciooferta = models.DecimalField(max_digits=11, decimal_places=2, default=Decimal('0.00'))
    foto = models.ImageField(upload_to='local/%Y/%m', null=True, blank=True, verbose_name='Foto')
    oferta = models.BooleanField(default=True, verbose_name='Oferta')
    estado = models.BooleanField(default=True, verbose_name='Estado')
    delete = models.BooleanField(default=False)
    def __str__(self):
        return "{} {} {}".format(self.nombre, self.descripcion, self.precio)


    class Meta:
        verbose_name = 'Platos'
        verbose_name_plural = "Platos"
        ordering = ('nombre',)