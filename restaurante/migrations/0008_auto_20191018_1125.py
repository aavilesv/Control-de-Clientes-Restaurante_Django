# Generated by Django 2.1 on 2019-10-18 16:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurante', '0007_auto_20191014_2135'),
    ]

    operations = [
        migrations.AlterField(
            model_name='local',
            name='ubicacion',
            field=models.CharField(blank=True, default='', max_length=1000, verbose_name='Ubicacion'),
        ),
    ]
