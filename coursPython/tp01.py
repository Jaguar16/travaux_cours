from random import randint
def choix_ordi():
    alea= randint(0,2)
    if alea == 0 :
        return 'pierre'
    if alea == 1 :
        return 'feuille'
    return 'ciseaux'

def pfc():
    choixOrdi = choix_ordi()
    choixOrdiH = choix_ordi()           ## Ordi choisi à la place de l'humain
    msg = input('Quel est ton choix, Humain ? ').lower()
    print('Tu as choisi',msg, 'Humain .')
    if msg == 'pierre' or msg == 'feuille' or msg == 'ciseaux' :
        print('Ok')
    else :
        print("Arrête d'écrire n'importe quoi, pour la peine je choisis à ta place ...")
        print("Euhh,",choixOrdiH)
        msg = choixOrdiH

    print('Humain :', msg)
    print('Ordi :', choixOrdi)

    if choixOrdi == msg :
        print("égalité")
    elif choixOrdi == 'feuille' and msg == 'ciseaux':
        print('Tu as Gagné')
    elif choixOrdi == 'pierre' and msg == 'feuille':
        print('Tu as Gagné')
    elif choixOrdi == 'ciseaux' and msg == 'pierre':
        print("Tu as Gagné")
    else : print("J'ai Gagné")

##pfc()

def juste_prix():
    prix = randint(0, 100)
    i = 0
    while i <= 7 :
        i = i + 1
        humain = input('Entrer un prix : ')
        if int(humain)> prix :
            print("C'est moins")

        elif int(humain)< prix :
            print("C'est plus")

        else : return print("C'est ça, bien joué")

    return print("Perdu, tu n'as droit qu'à 7 proposition. Le Juste Prix est", prix)

##juste_prix()

        
def juste_prix_ordi():
    print("Choisis un nombre entre 0 et 100. Je vais tenté de le deviner.")
    print("Si je trouve dis moi : 'Bingo' ")
    i = 0
    prix = 0
    minimum = 0
    maximum = 100
    while i <= 7 :
        i = i + 1
        prix = (minimum + maximum) // 2
        print('Est-il au-dessus ou au-dessous de ',prix ,'? ')
        humain = input().lower()
        if humain == 'bingo' : return print('Je suis trop fort')
        elif humain == 'au-dessus' or humain == 'au dessus' :
            minimum = prix
        elif humain == 'au-dessous' or humain == 'au dessous':
            maximum = prix

    return print("Soit tu te fous de ma gueule soit tu t'es trompé(e) .")




##juste_prix_ordi()
###########################################tpclasse######################################################

##
##def choix_ordi():
##    alea= randint(0,2)
##    if alea == 0 :
##        return 'pierre'
##    if alea == 1 :
##        return 'feuille'
##    return 'ciseaux'
##
##
##def pcf():
##    humain = input('Quel est ton choix Humain ? ')
##    print('Tu as choisis', humain)
##    if humain == 'pierre' or humain == 'feuille' or humain == 'ciseaux' :
##        print('Ok')
##    else : print('Choix incorrect, je choisis pour toi')
##    
##
##pcf()
##
##
##
##
##
##
##







































