from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Head_detail(models.Model):
    id = models.AutoField(primary_key =True)
    user = models.OneToOneField(User, on_delete=models.CASCADE )
    number = models.IntegerField()
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=225)

    def __str__(self):
        return self.name


class Category(models.Model):
    id = models.AutoField(primary_key = True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

choice = (("1", "Available"),("2", "Not Available"))

class Stock(models.Model):
    id = models.AutoField(primary_key = True)
    name = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    Status = models.CharField(choices=choice, max_length=50)
    quantity = models.IntegerField()
    head = models.ForeignKey(Head_detail, blank=True, null=True, on_delete=models.SET_NULL)
    sub_head = models.ForeignKey('subhead.Subhead_detail', blank=True, null=True, on_delete=models.SET_NULL)

