 ###-------------EXO 1------------###           
from math import*
from turtle import*
def racine(k,p, dim = 100):
    angle = 2 * pi * k / p
    return (100 * cos(angle), 100 * sin(angle))

def poly_reg(p):
    up()
    goto(100, 0)
    down()
    for k in range(1, p // 2 + 1):
        for i in range(1, p + 1):
            goto(racine(i * k, p))

poly_reg(5)
update()
mainloop()

###--------------EXO 2 --------------###

def sort_dutch(L):
    b = 0
    i = 0
    r = len(L) - 1
    while i <= r:
        if L[i] == "B":
            (L[b], L[i]) = (L[i], L[b])
            b += 1
            i += 1
        elif L[i] == "R":
            (L[i], L[r]) = (L[r], L[i])
            r -= 1
        else :
             i += 1

from random import*

def random_dutch(n):
    L = []
    for i in range (n):
        r = randint (1, 3)
        if r == 1:
            L.append("B")
        elif r == 2:
            L.append("W")
        else:
            L.append("R")
        return L

###---------------EXO 3--------------###
def exo3_1(x):
    try:
        return x == float(x)
    except:
        return False

def exo3_2(L):
    try:
        M=[]
        b=[]
        for c in L:
            if type (c)==float or type(c)==int:
                M.append(c)
        return sum(M)/len(M)
    except:
        print("moyenne d’une liste de nombres vide")
###---OU---###
def moyenne(L):
    somme = 0
    taille = 0
    for e in L:
        if f(e):
            somme += 0
            taille += 1
    if taille  > 0:
        return somme / taille
    else :
        raise ValueError("moyenne d’une liste de nombres vide")

###---OU ENCORE---###
##def moyenne(L):
##    L_propre = [ e for e in L if f(e)
##        if f(e):
##            somme += 0
##            taille += 1
##    if taille  > 0:
##        return somme / taille
##    else :
##        raise ValueError("moyenne d’une liste de nombres vide")


def ecart_type(L):
    m = moyenne (L)
    return sqrt(moyenne([ (x-m) ** 2 for x in L]))



###---------------EXO 4-------------###

def lettres_freq_list (s):
    L=[chr(c)for c in range (ord('a'),ord('z')+1)]
    M=[]
    for el in L:
        if el in s:
            M.append(s.count(el))
        else :M.append(0)
    return M


