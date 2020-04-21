## MODULE TP7_UTILS.PY : manipulation de fichiers P(B)(G)(P)M

## déclaration des fonctions exportées

__all__ = ['pbm_vers_matrice','matrice_vers_pbm']



########################################################################

def fichier_vers_liste(nom_fichier) :

    """ lit le fichier et renvoie la liste des chaines de caractères 
élémentaires qu'il contient. Chaque chaîne de caractère élémentaire est 
délimitée par des espaces ou des retours à la ligne."""

    return [y for x in open(nom_fichier).readlines() \
              for y in x.strip('\n').split('#')[0].split(' ') if y != '']


########################################################################

def liste_vers_fichier(L,nom_fichier) :

    """ écrit le fichier contenant les chaînes de caractères de la liste L
séparées par des sauts de ligne."""
    
    f = open(nom_fichier,'w')
    f.write("\n".join(L) + "\n")
    f.close()

    
########################################################################
    
def pbm_vers_matrice(nom_fichier) :

    """ lit le fichier PBM et renvoie la matrice de booléens correspondante """

    L = fichier_vers_liste(nom_fichier)
    assert(L[0] == 'P1')
    l = int(L[1])
    h = int(L[2])
    res = [ [True] * l for i in range(h)]
    for i in range(3,len(L)) :
        res[ (i-3) // l ] [ (i-3) % l ] = (L[i] == '1')
    return res

########################################################################
    
def matrice_vers_pbm(M , nom_fichier) :

    """ ecrit le fichier PBM correspondant à la matrice de booléens M """

    h = len(M)
    l = len(M[0])
    L = ['P1' , str(l) , str(h)]
    for li in range(h) :
        for co in range(l) :
            if M[li][co]:
                L.append('1')
            else :
                L.append('0')
    liste_vers_fichier(L , nom_fichier)

########################################################################

