
##---------TD6----------------------------
##----------Exercice 1------------------


def est_carre(M):
    for i in range(len(M)):
        if len(M) != len(M[i]) :
            return False

    return True





### Pour est_magique je stock toute les sommes dans une listes et je compares les eléments de cette listes

def est_magique(M):
    pivot = sum(M[0])
    somme = list()
    somme_diag1 = 0
    somme_diag2 = 0
    somme_col = 0

    for i in range(len(M)):
        somme.append(sum(M[i]))

        
    for i in range(len(M)):
        somme_diag1 = somme_diag1 + M[i][i]
        
    somme.append(somme_diag1)

    
    for i in range(len(M)):
        somme_diag2 = somme_diag2 + M[i][(len(M)-1)-i]
        
    somme.append(somme_diag2)
    
    for j in range(len(M)):
        for i in range(len(M)):
            somme_col = somme_col + M[i][j]

        somme.append(somme_col)
        somme_col = 0


    for el in somme :
        if el != pivot :
            return False

    return True


##---------------Exercice 2-----------------

def identite(n):
    res = [ [0]*n for i in range(n)]
    for i in range(n) : res[i][i] = 1 
    return res


##-----------------Exercice 3++++++----------------
from math import log

def m(n) : return n//2
def j(n) : return int(log(n)//log(2))





##------------Exercice 4 ------------------
##1) Le problème est que l'on arrive à un moment où m = 2 g = 2 d= 3 et on rentre dans une boucle infini
##### Voici un code qui marche (même s'il n'a pas de jambes)

def recherche_dichotomique(x,L):
    g= 0
    d = len(L)-1
    m = (g+d)//2
    while g < d :
        if L[m] == x :
            return m
        elif L[m] > x :
            d = m-1
        else :
            g = m+1
        m = (d+g)//2
    return g


##-----------Exercice 5--------------------------

def fusion(L1,L2) :
    if L1==[] :return L2
    if L2==[] :return L1
    if L1[0]<L2[0] :
        return [L1[0]]+fusion(L1[1 :],L2)
    else :
        return [L2[0]]+fusion(L1,L2[1 :])

def trifusion(L) :
    if len(L)<=1 : return L
    L1=[L[x] for x in range(len(L)//2)]
    L2=[L[x] for x in range(len(L)//2,len(L))]
    return fusion(trifusion(L1),trifusion(L2))

    

##-------------Exercice 6---------------
##1) Avec cette methode il nous faut n multiplications pour calculer x**n



def power(x,n):
    if n == 0 : return 1
    
    xpn = power(x, n//2)
    
    if n % 2 == 0 :
        return xpn * xpn
    return x * xpn * xpn



















