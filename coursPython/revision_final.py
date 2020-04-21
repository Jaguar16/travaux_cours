### Séances révision
from cmath import *
from turtle import *

def racine(k,p):
    r = exp((k*2j*pi)/p)
    return (round(r.real,3),round(r.imag,3))


def poly_reg(p):
    up()
    goto(0,0)
    down()
    for k in range(1,(p//2)+1):
        for i in range(p):
            goto(racine((k+i)%p,p)[0],racine((k+i)%p,p)[1])

    


def sort_dutch(L):
    b=0
    i=0
    r=len(L)-1
    while True :
        if L[i]=='B':
            (L[i],L[b])=(L[b],L[i])
            b+=1
            i+=1
            print(i,b,r)

        elif L[i]=='R':
            (L[i],L[r])=(L[r],L[i])
            r-=1
            print(i,b,r)

        elif L[i]=='W':
            i+=1
            print(i,b,r)

        if i>r : break

    return L


def letters_freq_list(s):
    return [s.lower().count(c) for c in [chr(i) for i in range(ord('a'),ord('z')+1)]]




##############SUDOKU#########

def check_square(M):       ### Vérifie si la matrice M est carré
    for el in M :
        if len(el)!=len(M) :
            return False
    return True



def check_form_sudoku(M):  ### Vérifie que M a la forme d'un sudoku i.e que M est de taille 2²*2² ,3²*3² etc...
    nb_colonnes = len(M)
    return str((nb_colonnes)**(1/2)).split(".")[1] == '0'


def check_line(M,i):   ### Vérifie qu'il y a bien une seul apparition des chiffres de 1 à n² dans la ième ligne
    cpt = 0
    for el in M[i]:
        cpt = cpt + M[i].count(el)

    return cpt == sum(1,len(M[i]+1))


def check_column(M,i): ### Vérifie qu'il y a bien une seul apparition des chiffres de 1 à n² dans la ième column
    cpt = 0
    for j in range(len(M)):
        cpt = cpt + M[j][i]

    return cpt == sum(1,len(M[i]+1))



def check_sous_matrice(M,i):
    cpt = 0
    n = int((len(M)**(1/2)))
    grille = []
    for j in range(n):
        grille.append(M[j][i*n:(i*n)+n])

    return grille


M = [[3,9,1,2,8,6,5,7,4],[4,8,7,3,5,9,1,2,6],[6,5,2,7,1,4,8,3,9],[8,7,5,4,3,1,6,9,2],[2,1,3,9,6,7,4,8,5],[9,6,4,5,2,8,7,1,3],[1,4,9,6,7,3,2,5,8],[5,3,8,1,4,2,9,6,7],[7,2,6,8,9,5,3,4,1]]


    
























