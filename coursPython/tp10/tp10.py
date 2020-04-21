##---------------TP 10--------------


##-------Exercice 1---------##


def affiche_calcul_pgcd_rec(n,m):
    if n<=m :(n,m)=(m,n)
    if n == m : return n
    else :
        print('calcul le pgcd de n={} et m ={}'.format(n,m))
        q = n//m
        if (n-q*m)==0 : return m
        return affiche_calcul_pgcd_rec(n-q*m,m)

#print('Le pgcd de 21 et 15 est {} (definition récursive)\n'.format(affiche_calcul_pgcd_rec(21,15)))



def affiche_calcul_pgcd_it(n,m):
    while True:
        print('calcul le pgcd de n={} et m ={}'.format(n,m))
        if n<=m :(n,m)=(m,n)
        if n == m : return n
        q  = n//m
        if (n-q*m)==0 : return m
        n = n - q*m
        
        
#print('Le pgcd de 21 et 15 est {} (avec une boucle While)'.format(affiche_calcul_pgcd_it(21,15)))



##-------Exercice 2---------##

L = [1,9,5,7,8,11]
def compare_et_echange(L,i):
    if L[i] > L[i+1]:
        tmp = L[i]
        L[i] = L[i+1]
        L[i+1] = tmp
    




def affiche_etape(L,passe,i):
    s = 'passe {} :'.format(passe)
    for j in range(len(L)):
        if j==i or j == i+1: s += '['+str(L[j])+']'
        else :
            s = s +' '+ str(L[j])+ ' '

    print(s)



def affiche_tri_bulles(L):
    for j in range(len(L)-2) :
        for i in range(len(L)-1-j):
            compare_et_echange(L,i)
            affiche_etape(L,j+1,i)

        
    print('Résultat : {}'.format(L))




##-------Exercice 3---------##



def listes_nombre_occurences(L):
    return [L.count(i) for i in range(max(L)+1)]


def cree_liste_triee(N):
    return [j for j in range(len(N)) for i in range(N[j])]
    L = list()
    for j in range(len(N)):
        for i in range(N[j]):
            L.append(j)
    return L 

def tri_comptage(L):
    return cree_liste_triee(listes_nombre_occurences(L))


##-------Exercice 4---------##
from villes import *


def distance_euclidienne(A,B):
    return round(((((coordonnees[B][0]-coordonnees[A][0])**2)+((coordonnees[B][1]-coordonnees[A][1]))**2)**(1/2)),3)


