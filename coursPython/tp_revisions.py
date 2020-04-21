###-----------------TP 8 Revisions-------------

##-----------------Exercice 1 --------------

#--1)-----

def affiche_liste(L):
    for i in range(len(L)):
        print('L[{}] = {}'.format(i,L[i]))


#--2)-----

def affiche_matrice(M):
    for i in range(len(M)):
        print('M[{}] = {}'.format(i,M[i]))

#--3)-----

def affiche_dico(D):
    for clefs in D :
        print('D[{}] = {}'.format(clefs,D[clefs]))

#--4)-----

def affiche_matrice2(M):
    for i in range(len(M)):
        for j in range(len(M[i])) :
            print('M[{}][{}] = {}'.format(i,j,M[i][j]))

#--5)-----

def affiche_matrice3(M):
    taille_matrice = len(M) * len(M[0])
    j = len(M[0]) - 1
    for i in range(taille_matrice):
        print('M[{}][{}] = {}'.format((i%len(M[0])),j,M[i%len(M[0])][j]))
        if ((i+1)%len(M[0])) == 0 : j -=1

##--test--## : affiche_matrice3([[4,'a',], [2, 'b']])

##-----------------Exercice 2 --------------




def recherche_liste(L,x):
    for i in range(len(L)):
        if x == L[i] :
            return i
    return print(None)

##--test--## : recherche_liste([4,'a',7,8,9,6,5,4,1],'a')

def recherche_matrix(M, x):
    for i in range(len(M)):
        for j in range(len(M[0])):
            if M[i][j] == x : return (i,j)
    return print(None)

##--test--## : recherche_matrix([[4,'a'], [2, 'a']], 2)

def recherche_cle(D,x):
    for cle in D :
        if D[cle] == x: return cle
    return print(None)



##--test--## : recherche_cle({'a':'1', 'b':'02', 'c':'03', 'd':'1', 'e':'4'}, '4')




##---------------Exercice 3---------------------------


def liste_vers_matrice(L,largeur):
    liste = []
    matrice = []
    if len(L)%largeur == 0 :
        for i in range(len(L)):
            liste.append(L[i])
            if (i+1) % largeur == 0 :
                matrice.append(liste)
                liste = []

        return matrice
    else :
        return " L'argument largeur n'est pas un multiple de la longeur de L"

##--test--## : liste_vers_matrice([4,'a', 2, 'b', 6, 'c'],2)






def matrice_vers_liste(M):
    ##return [sum(ligne) for ligne in M]    ## Solution ma foi ... élégante .
    liste = []
    for ligne in M :
        liste = liste + ligne

    return liste

##--test--## : matrice_vers_liste([[4, 'a'], [2, 'b'], [6, 'c']])






def matrice_vers_liste_العربية(M) :
    liste = []
    for ligne in M :
        ligne.reverse()
        liste = liste + ligne
        
    return liste

##--test--## : matrice_vers_liste_العربية([[4, 'a'], [2, 'b'], [6, 'c']])
