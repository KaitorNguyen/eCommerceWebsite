# Generated by Django 4.2 on 2023-05-08 10:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0003_remove_cart_created_date_remove_cart_product_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='paymentmethod',
            name='active',
            field=models.BooleanField(default=True),
        ),
    ]
