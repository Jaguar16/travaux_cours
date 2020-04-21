from viewer import voir_fichier
from tp7_utils import *



############-----Exercice 1------------######

#voir_fichier('space-invader-pieuvre.pbm')
#voir_fichier('space-invader-soucoupe.pbm', quadrillage=False)

#M = pbm_vers_matrice('space-invader-pieuvre.pbm')
##M[3][4] = True
##matrice_vers_pbm(M, 'space-invader-pieuvre2.pbm')

#voir_fichier('space-invader-pieuvre2.pbm')



####---------Exercice 2 -------------------####


def affiche_matrice_booleens(M,plein,vide):
    for lignes in M :
        for i in range(len(lignes)):
            if lignes[i] == True : print(plein, end = '')
            else : print(vide, end = '')
        print('\n')






####---------Exercice 3------------------###



def ajoute_horizontal(M1,M2):
    M3 = []
    for lignes in M1 :
        for ligne2 in M2 :
            M3 = [lignes + ligne2]

    return M3


M = pbm_vers_matrice('space-invader-pieuvre.pbm')

M2 =  ajoute_horizontal(M,M)

M3 = ajoute_horizontal(M2,M)

matrice_vers_pbm(M, 'space-invader-3-pieuvre.pbm')

