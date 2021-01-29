from fileinput import FileInput
from django import forms
from seguridad.models import *

class PaisForm(forms.ModelForm):
    class Meta:
        model = Pais
        fields = ['nombre']

class ProvinciaForm(forms.ModelForm):
    class Meta:
        model = Provincia
        fields = ['nombre','pais']

class CiudadForm(forms.ModelForm):
    class Meta:
        model = Ciudad
        fields = ['nombre','provincia']
