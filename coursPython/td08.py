##-----------------TD 8 -------------
import os
##--------------Exercice 1-------------------


def multiensemble(s):
    d = dict((c,0) for c in s)
    for c in s :
        d[c] = d[c] + 1
    return d

##---------------Exercice 2--------------

##1) On ouvre un fichier texte avec : open('fichier.txt', 'w', encoding ='utf-8')
## On le ferme avec : fichier.close()


##2) On va écrire les données dans ce fichier avec la methode .write(string)
##   Dans un ficher texte on utilisera des strings en mode écriture .

##--------------Exercice 3----------------

texte = open('texte.txt','w', encoding = 'utf-8')
for i in range(5):
    texte.write('copyright' + '\n' + 'Des patates ')
for i in range(5):
    texte.write('bla' + '\n')

texte.close()



def affiche_ligne(s):
    texte = open('texte.txt','r', encoding = 'utf-8')
    i = 1
    for ligne in texte :
        if s in ligne : print(i,ligne)
        i += 1
    texte.close()

##-------------Exercice 4------------------




def majuscules(f):
    f1 = open(f.split('.')[0] + '-maj.txt', 'w', encoding = 'utf-8')
    fichier = open(f , 'r', encoding = 'utf-8')
    for ligne in fichier :
        f1.write(ligne.upper() + '\n')

    f1.close()
    fichier.close()
    
##--------------Exercice 5--------------------

achats0 = [2374, 1280, 2374, 7530]
bdd0  = [{'bar_code':1280, 'description':'scie' , 'price':22.5} , \
         {'bar_code':2374, 'description':'tournevis' , 'price':3.15} , \
         {'bar_code':7530, 'description':'platre' , 'price':4.15} , \
         {'bar_code':8120, 'description':'cable' , 'price':14.15} ]


def affiche_facture(achats,bdd):
    dic_achats = dict((bdd[i]['description'],achats.count(bdd[i]['bar_code'])) for i in range(len(bdd)) if bdd[i]['bar_code'] in achats)
    total = sum(dic_achats[k]*el['price'] for k in dic_achats for el in bdd if k == el['description'] )
##    total = 0
##    for k in dic_achats:
##        for el in bdd :
##            if k == el['description'] :
##                total = total + dic_achats[k]*el['price']
    for k,v in dic_achats.items() :
        print(k,'X', v)

    print('TOTAL :', total)
    ##print(dic_achats.items())
















