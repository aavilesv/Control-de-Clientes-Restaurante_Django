# Generated by Django 2.1.12 on 2019-10-04 00:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurante', '0002_auto_20191003_1907'),
    ]

    operations = [
        migrations.AlterField(
            model_name='local',
            name='visita',
            field=models.IntegerField(default=0, verbose_name='Visita'),
        ),
    ]