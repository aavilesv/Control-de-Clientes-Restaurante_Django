# Generated by Django 2.1 on 2019-10-06 02:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurante', '0003_auto_20191003_1913'),
    ]

    operations = [
        migrations.AddField(
            model_name='horariolocal',
            name='delete',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='local',
            name='delete',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='platos',
            name='delete',
            field=models.BooleanField(default=False),
        ),
    ]