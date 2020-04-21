 ###-----------------TD7------------

###------------EXERCICE 1 -------------------

minuscules = {chr(i) for i in range(97,123)}
minuscules = {chr(o) for o in range(ord('a'),ord('z') + 1)}

def nb_occurences_minuscules(s):
    return sum(1 for c in s if c in minuscules)

def ensemble_minuscules(s):
    return {c for c in s if c in minuscules}

def nb_minuscules(s):
    return len(ensemble_minuscules(s))


###---------------Exercice 2 ---------------------
##
##1) print(contacts.keys()) affiche toutes les clés du dict
##2) ||||||||||||.values()) affiche toutes les valeurs du dict
##3) contacts['Chloé'] = '0611223344'
##4) contacts['Sarah'] = '0145444589'
##5) contacts['Lyes']
##6) contacts.pop('Chloé') ou del contacts['Chloé']
##


##-------------Exercice 3 -----------------------------


contacts = {'Chloé': '0601020304' , 'Quentin': '0710203040' , 'Lyes' : '0623344556' , 'Alex ':'0412345678'}
## L = [('10:03 ', '0412345678'), ('9:45', '0601020304'), ('32 Juin', '0623344556'), ('32 Joint', '0601020304')]




def inverse_contacts(contact):
    inv_contact = {}
    contact = contact.items()
    
    for clef, valeur in contact:
        if valeur in inv_contact :
            inv_contact[valeur] = [inv_contact[valeur]] + [clef]
        else : inv_contact[valeur] = clef
        
    return inv_contact




def affiche_journal_appel(L, contact):
    inv_contact = inverse_contacts(contact)

    def jointure(sep,L):
        joint = str(L[0])
        for el in L[1:] :
            joint = joint + ' ' + sep +' ' + str(el)
        return joint

    for date, numero in L :
        if isinstance(inv_contact[numero], list) :
            j = jointure('ou',inv_contact[numero])
            print(date, j)
        else : print(date,inv_contact[numero])
        


###---------------Exercice 4 ---------------------------

find_num_contact = {}

def trouve_numero(lst_contact, nom):
    if nom in find_num_contact :
        return find_num_contact[nom]
    else :
        for name, num in lst_contact :
            if name == nom :
                find_num_contact[nom] = num
                return num

    return 'Contact inexistant'


## L'intéret de cette fonction est d'économiser des calcule. On stock les calcules éffectué s'il l'utilisateur nous
#####--------- le demande on l'affiche sans avoir à le calculer . Utile pour les definitions recursives


##----------------Exercice 5-----------------


def fibo(n):
    print('début calcul de fibo(', n,')', sep='')
    if n < 2 :
        res = 1

    else :
        res = fibo(n-1) + fibo(n-2)
        
    print('fin calcul de fibo(', n,')', sep='')
    return res



fibo_memo_cache = {}


def fibo_memo(n):
    print('début calcul de fibo_memo(', n,')', sep='')
    if n in fibo_memo_cache :print('fin calcul de fibo_memo(', n,')', sep='') ; return fibo_memo_cache[n]
    else :
        if n < 2 :
            res = 1

        else :
            res = fibo_memo(n-1) + fibo_memo(n-2)
    
    print('fin calcul de fibo_memo(', n,')', sep='')
    fibo_memo_cache[n] = res
    return res









