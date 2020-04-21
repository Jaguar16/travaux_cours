##Exercice 1
from time import time


def fac_rec(n):
    if n < 0 :
        return 1
    return fac_rec(n-1) * n

def fac(n):
    res = 1
    while n >= 1 :
        res = res * n
        n = n - 1
    return res

##start = time()    #top chrono
##fac_rec(10000)
##end = time()      #fin chrono
##
##deb = time()    #top chrono
##fac(10000)
##fin = time()      #fin chrono
##
##print('Pour la fonction fac_rec:', end-start)
##print('Pour la fonction fac:', fin-deb)

####Exercice 2
def f(x):
    return (x**2) - 2


def deriv(f,a,h) :
    return (f(a+h)-f(a))/h


def solve(f,a,h) :
    while abs(f(a)) >= h :
        a = a - f(a) / (deriv(f,a,h))
    return a




##Exercice 3


def machine_cafe():
    state = - 1
    while True :
        state = input('Mets des sous ')
        if state == 'R' : state = -1
        if state == '1' :
            state = input('Mets des sous ')
            if state == '2' :
                print('Et voilà du café....What else!')
            else : state =  - 1
        if state == '2' :
            state = input('Mets des sous ')
            if state == '2' :
                print('Voilà votre café et votre monnaie')
                state = - 1 
            if state == '1' :
                print('Voilà votre café')
            else : state = - 1


machine_cafe()



def star() :  print ('*', sep ='', end ='')
def sharp() : print ('#', sep ='', end ='')
def newline() : print ()




##def tapis_a(l, h):
##    i = 0
##    while i <= h :
##        l*star()
##        newline()
##        i = i + 1
##        
##tapis_a(5,6)




























