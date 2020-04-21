def ens_chiffre(n):
    return set(el for el in str(n))

def verifier_entre(a,b):
    tv = False
    for k in range(a,b+1):
        if '7' not in ens_chiffre(2**k):
            tv = True
            print('theoreme faux: 2**{} = {}'.format(k,2**k))
            break
        
    if tv == False : print('Theoreme Vrai')
    
        
def explose(n):
    return list(int(el) for el in str(12345))

def implose(Lc):
    s = ''
    for el in Lc:
        s = s+ str(el)
    return int(s)

def est_abondant(n):
    d = []
    for i in range(1,n):
        if n % i == 0 :
            d.append(i)

    return n < sum(d)

