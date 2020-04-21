from fr_dic import fr_dic
##from tp6 import *
from random import randint
from unicodedata import normalize
import webbrowser





def asciize(s):
    return normalize('NFKD',s).encode('ascii','ignore').decode('ascii')

def mot_au_hasard():
    return fr_dic[randint(0,len(fr_dic))]

#print('Voilà un mot tiré au pif :',mot_au_hasard())



def mots_vers_liste(m):  ## renvoi une liste à partir d'un mots en faisant apparaître uniquement le 1er et der 
    lm = [m[0]]
    for i in range(1,len(m)) :
        lm.append('-')

    lm[-1] = m[-1]
    return lm

mots_vers_liste('avion')

def liste_vers_mots(Liste): ## renvoi une string à partir de la concaténation de tous les éléments de Liste
    mots = ''
    for el in Liste :
        mots = mots + el

    return mots


def met_a_jour(Liste,m,c):    ## met à jour la liste et renvoi vrai si c est dans mot et faux dans le cas contraire           
    m_brut = asciize(m)     ## m_brut représente la string m sans accents
    if c in m_brut[1:-1] :     ## c in m_brut[1:-1] la 1er et dernière lettre étant donné
        for i in range(len(m)):      ## pas la peine de les mettres à jour .
            if m_brut[i] == c :
                Liste[i] = m[i]
        return True
    else : return False



def joue_concepteur(vies):
    vie = vies
    mot = mot_au_hasard()    ## prends un mot au hasard
    mot_liste = mots_vers_liste(mot)  ## transforme le mot en liste(de meme taille que mot) avec la 1er et der lettre visible
    liste__mot = liste_vers_mots(mot_liste) ## transforme la liste en string .
    
    while True :
        if vie == 0 : break
        print(liste__mot)
        c = input('Donne une lettre : ').lower()
        if met_a_jour(mot_liste,mot,c) :
            liste__mot = liste_vers_mots(mot_liste)
            print("C'est bien")
            liste__mot

        else : print('Raté ...haha') ; vie -=1

        if '-' not in liste__mot and vie != 0 :
            webbrowser.open('https://www.youtube.com/watch?v=6b1FN14Sh2c', autoraise=False)
            return print("Youhou Gagné ! c'était bien :", mot)

    return print('Perdu! Tu as perdu toutes tes vies ... Haha\nMot secret :', mot)


##joue_concepteur(10)


##----------------Exercice 3 -------------------------


def candidats(deb,fin,l):   ## Solution la plus simple et la plus pythonesque
    return list(el for el in fr_dic if el[0]==deb and el[-1]==fin and len(el)==l)




def candidats_2(d,f,l) :  ## Autre solution 
    motdfl = []
    for el in fr_dic :
        if el[0] == d and el[-1] == f and len(el) == l :
            motdfl.append(el)

    return motdfl


def candidats_3(d,f,l) : ## Encore autre solution
    motdfl = []
    for i in range(len(fr_dic)) :
        if fr_dic[i][0] == d and fr_dic[i][-1] == f and len(fr_dic[i]) == l :
            motdfl.append(fr_dic[i])

    return motdfl




##def choix_lettre(s,L):
##    lettre_possible = []
##    liste_vers_mot = liste_vers_mots(L)      ## on transforme la liste en string pour parcourir les charactères ...
##    for c in s :
##        for char in liste_vers_mot :
##                if char != c and char not in s and char not in lettre_possible :
##                    lettre_possible.append(char)
##
##    return lettre_possible
##            

def choix_lettre(s,L):
    lettre_possible = []
    
    for i in range(len(s)) :
        if s[i] == '-' or s[i] == '_' :
            for mot in L :
                if mot[i] not in lettre_possible :
                    lettre_possible.append(mot[i])

    if len(lettre_possible) > 1  :
        hasard = randint(0,len(lettre_possible)-1)
        return asciize(lettre_possible[hasard])
    #return asciize(lettre_possible[hasard])
            


def filtre_lettre(c,L):
    Liste_filtrer = []

    for word in L:
        if c not in asciize(word[1:-1]) :
            Liste_filtrer.append(word)

    return Liste_filtrer
        


def est_compatible(s,m):
    if len(s) != len(m) :return False
    for i in range(len(s)):
        if s[i].isalpha() :
            if s[i] != m[i] :
                return False

    return True




def joue_chercheur(vies):
    vie = vies
    mot_j = asciize(input('Donne moi ton indice de départ : ')) ## Sous la forme a------z
    candidat = candidats(mot_j[0],mot_j[-1],len(mot_j))
    ##prop_lettre = choix_lettre(s, candidat)


    while True :
        if vie == 0 : break
        
        if len(candidat) == 1 :
            return print("J'ai trouvé, c'est", candidat[0])
        
        prop_lettre = choix_lettre(mot_j, candidat)
        ##print("J'hésite entre :", candidat)
        print("Je demande le",prop_lettre,".",'Nouvel Indice ? ')
        mot_j = asciize(input())

        if prop_lettre in mot_j[1:-1] :
            candidat = [candidat[i] for i in range(len(candidat)) if est_compatible(mot_j,candidat[i])]

        elif prop_lettre not in mot_j[1:-1] :
            vie -=1
            if vie != 1 : print("Il me reste encore",vie,'vies')
            else : print("Il me reste :",vie,'vie. ça va être tendu ma geule.')
            candidat = filtre_lettre(prop_lettre,candidat)
        

    return "bien joué je n'ai pas trouvé"

        








##joue_chercheur(10)







