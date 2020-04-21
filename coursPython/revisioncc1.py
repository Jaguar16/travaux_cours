##--------Revision---------##

####Exercice 4 td 1   #####

def max_abs(x, y, s):
    if abs(x)>abs(y): print(s, x)
    if abs(x)==abs(y) : print(s, abs(x))
    else : print(s, y)

##print(max_abs(3,-33), 'Normalement 3')
##print(max_abs(3,-2), 'Normalement 3')
##print(max_abs(-3,3), 'Normalement 3')
##print(max_abs(-3,5), 'Normalement 5')
##print(max_abs(3,4), 'Normalement 4')
##print(max_abs(4,3), 'Normalement 4')
##max_abs(3,-9, "le plus grand en valeur absolue est :")



def hconv(n):
    h = n//60//60
    m = (n//60)%60
    s = n%60

    print(h, 'hours', m, 'minutes', s, 'seconds in', n)

##hconv(4567)




def fac_rec(n):
    if n == 1 : return 1
    return n * fac_rec(n -1)

print(fac_rec(5))
