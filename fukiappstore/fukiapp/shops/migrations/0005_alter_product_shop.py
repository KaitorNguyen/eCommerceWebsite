# Generated by Django 4.2 on 2023-04-18 22:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shops', '0004_product_description_shop_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='shop',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, related_name='proshop', to='shops.shop'),
        ),
    ]
