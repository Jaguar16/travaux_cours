__all__ = ['voir_fichier']

import sys
from tkinter import *

def int_to_hex(i):
    s = hex(i)[2:]
    return '0' * (2 - len(s)) + s

def somme_couleur(c1,c2) :
    assert(len(c1) == len(c2) and len(c1) == 3)
    return (c1[0]+c2[0] , c1[1] + c2[1] , c1[2] + c2[2])

def divise_couleur(c,n) :
    assert(len(c) == 3)
    return (c[0] // n , c[1] // n , c[2] // n)

def arrondi_superieur_quotient(n , m) :
    if n % m == 0 :
        return n // m
    else :
        return n // m + 1

def couleur_moyenne_sous_matrice(M , li , co , n) :
    l = len(M[0])
    h = len(M)
    li2_max = min(li + n , h)
    co2_max = min(co + n , l)
    nb_pixels = (li - li2_max) * (co - co2_max)
    acc = (0,0,0)    
    for li2 in range(li , li2_max) :
        for co2 in range(co , co2_max) :
            acc = somme_couleur(acc , M[li2][co2])    
    assert(nb_pixels > 0) 
    return divise_couleur(acc , nb_pixels)
    
def divise_echelle(M,n) :
    h = len(M)
    l = len(M[0])
    l2 = arrondi_superieur_quotient(l , n)
    h2 = arrondi_superieur_quotient(h , n)
    res = [ [(0,0,0)] * l2 for i in range(h2)]
    for li in range(0 , h , n) :
        for co in range(0 , l , n) :
            res[li // n][co // n] = couleur_moyenne_sous_matrice(M , li , co , n)
    return res


def voir_fichier(filename,quadrillage=None) :
    L = [y for x in open(filename).readlines() \
         for y in x.strip('\n').split('#')[0].split(' ') if y != '']

    if L[0] not in ['P1','P2','P3'] :
        print('format non reconnu')
        exit()

    M_w = int(L[1])
    M_h = int(L[2])
    M = [ [None] * M_w for i in range(M_h)]
    if L[0] == 'P1' :
        L = L[: 3 +  M_h * M_w]
        for i in range(3,len(L)) :
            M[ (i-3) // M_w ] [ (i-3) % M_w ] = ((1- int(L[i])) * 255,) * 3
    if L[0] == 'P2' :
        L = L[: 3 +  M_h * M_w]
        for i in range(4,len(L)) :
            M[ (i-4) // M_w ] [ (i-4) % M_w ] = (int(L[i]),) * 3 
    if L[0] == 'P3' :
        L = L[: 4 +  M_h * M_w]
        for i in range(4 , len(L) , 3) :
            x = (i - 4) // 3
            M[ x // M_w ] [ x % M_w ] = (int(L[i]) , int(L[i+1]) , int(L[i+2]))

    canvas_h_max = 400
    canvas_w_max = 400
    M_h = len(M)
    M_w = len(M[0])
    fact = 1
    while M_h // fact > canvas_h_max or M_w // fact > canvas_w_max :
        fact = fact + 1
    M = divise_echelle(M,fact)
    pixel_size = 1
    while M_h * pixel_size <= canvas_h_max and M_w * pixel_size <= canvas_w_max :
        pixel_size = pixel_size + 1
    if quadrillage == True : 
       widthstr = '1'
    elif quadrillage == False :
        widthstr = '0'
    elif pixel_size < 10 :
        widthstr = '0'
    else :
        widthstr = '1'
    M_h = len(M)
    M_w = len(M[0])
    canvas_h  = M_h * pixel_size
    canvas_w = M_w * pixel_size
    root = Tk()
    root.title(filename)
    canvas = Canvas(root,width=canvas_w,height=canvas_h)
    for i in range(M_h) :
        for j in range(M_w) :
            colorstr = '#' + ''.join([int_to_hex(k) for k in M[i][j]])
            canvas.create_rectangle(j * pixel_size, i * pixel_size, (j+1) * pixel_size , (i+1) * pixel_size, fill=colorstr,width=widthstr)
    canvas.pack()
    bouton_quitter=Button(root,text='Quitter',command=root.destroy)
    bouton_quitter.pack()
    root.mainloop()

