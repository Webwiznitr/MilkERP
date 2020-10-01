from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Subhead_detail(models.Model):
    id = models.AutoField(primary_key =True)
    user = models.OneToOneField(User, on_delete=models.CASCADE )
    number = models.IntegerField()
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=225)

    def __str__(self):
        return self.name

