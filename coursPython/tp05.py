##-----------------Exercice 1 ----------------------


def exo1():
    age = int(input('Combien de mois as-tu, Humain ? '))
    
    print("Tu as", age//12, "ans")

##exo1()



##--------------------Exercice 2 -------------------------

from random import randint



def exo2():
    d = randint(1,6)
    print("J'ai choisi un d au hasard .")
    essai = 1
    while True :
        joueur = int(input('A ton avis que vaut d ? '))
        if joueur == d :
            print("Gagné! Nombre d'essai :", essai)
            break
        essai += 1

##exo2()



##----------------Exercice 3 --------------------------------------



def tapis_A(n,m):
    s = '*'
    for i in range(n):
        print(s*m,sep='')


##tapis_A(7,9)

def tapis_B(n,m):
    et = '*'
    hashtag = '#'
    moitie = ((n+1)//2)
    for i in range(n):
        
        if i!= n//2 : print(moitie*hashtag,et,moitie*hashtag,sep='')
        else : print(et*m,sep='')


##tapis_B(7,9)



def tapis_C(n,m):
    p = '+'
    et = '*'
    for i in range(n):
        if i % 2 == 0 : print(p,et*(m-2),p,sep='')
        else : print(et,p*(m-2),et,sep='')



##tapis_C(7,9)




##------------------Exercice 4-------------------------- Alphabet = [' '] + [chr(i) for i in range(65,91)]



def somme_crypto(c1,c2):
    Alphabet = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    c3 = (Alphabet.index(c1) + Alphabet.index(c2)) % len(Alphabet)

    return Alphabet[c3]

##print(somme_crypto(' ','A'))
##print(somme_crypto('A','Z'))
##print(somme_crypto('A','B'))
    





def encrypt(m, k):
    res = ''
    if len(k) < len(m) :
        for i in range(len(k)+1) :
            k = k + k[i]
    for i in range(len(m)) :
        res = res + somme_crypto(m[i],k[i])

    return res


##print(encrypt('AAAAA','AZAZA'))
        
    
    









