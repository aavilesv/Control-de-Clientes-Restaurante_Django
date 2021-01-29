from fileinput import FileInput
from django import forms
from restaurante.models import *

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['descripcion','estado']


class PlatoForm(forms.ModelForm):
    class Meta:
        model = Platos
        fields = ['local','nombre','descripcion','descuento','precio','foto','oferta','estado','delete']


class HorarioForm(forms.ModelForm):
    class Meta:
        model = HorarioLocal
        fields = ['local','dia','horaInicio','horaFin','estado','delete']

