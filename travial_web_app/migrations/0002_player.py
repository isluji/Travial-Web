# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2016-11-10 07:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('travial_web_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, unique=True)),
                ('city', models.CharField(max_length=50)),
                ('birthdate', models.DateField()),
            ],
        ),
    ]
