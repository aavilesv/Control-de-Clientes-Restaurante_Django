# Generated by Django 2.1.12 on 2019-10-04 00:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurante', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='local',
            name='valortotal',
            field=models.FloatField(blank=True, default=0, null=True),
        ),
    ]
