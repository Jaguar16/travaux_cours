##-----------td9-----------##
from math import sqrt
##-------------Exercice 1------------##

## 1) les attributs d'instances sont les paramètres de l'objet(instance) en question.
## 1) les méthodes d'instances sont les fonctions de la classe qui vont modifier l'objet(instance) en question.
## 1) les méthodes d'instances sont les fonctions de la classe qui vont modifier l'objet(instance) en question.



##-------------Exercice 2------------##


class Vect2d :
    """La Classe des Vecteurs de 2 dimensions"""

    def __init__(self,x,y):
        self.x = x
        self.y = x

    def __repr__(self):
        return 'Vect2d({},{})'.format(self.x,self.y)

    def __add__(self,v2):
        """Méthode qui renvoie la somme avec le vecteur v2"""
        v3 = Vect2d(self.x + v2.x, self.y + v2.y)
        return v3

    def mul_ext(self,k):
        """Méthode qui renvoie le produit par un réel k"""
        vk = Vect2d((self.x)*k, (self.y)*k)
        return vk

    def zoom(self,k):
        """Méthode qui modifie votre vecteur par le produit par un réel k"""
        self.x = self.x * k
        self.y = self.y * k

    def prodscal(self,v2):
        """Méthode qui modifie votre vecteur par le produit scalaire d'un deuxième vecteur"""
        ps = self.x * v2.x + self.y * v2.y
        return ps

    def norme(self):
        """Méthode qui renvoie la norme du vecteur"""
        return sqrt(((self.x)**2)+((self.y)**2))




def add(v1,v2):
        """fonction qui renvoie la somme avec le vecteur v2"""
        v3 = Vect2d(v1.x + v2.x, v1.y + v2.y)
        return v3



##-------------Exercice 3------------##


class Climatiseur:

    def __init__(self,tmin,tmax,tinit=20):
        self.tmin = tmin
        self.tmax = tmax
        self.tinit = tinit


    def __repr__(self):
        return 'Climatiseur : Tmin = {} ; Tmax = {} ; T = {}'.format(self.tmin,self.tmax,self.tinit)


    def plus(self):
        if self.tinit < self.tmax :
            self.tinit = self.tinit + 1
        else : print("Température maximale atteinte")

    def moins(self):
        if self.tinit > self.tmax :
            self.tinit = self.tinit - 1
        else : print("Température Minimale atteinte")

    def affiche(self):
        print('Temperature actuel : {} °C, {} °F'.format(self.tinit, (self.tinit*9//5)+32))
