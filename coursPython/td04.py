from turtle import *
from random import randint


def dessine_maison(c):
    right(90)
    for i in range(4):
        forward(c)
        right(90)
    left(90)
    for i in range(2) :
        pencolor('red')
        left(120)
        forward(c)
    
dessine_maison(100)



def dessine_maison_absolue(c):
    up() ; goto(0,0) ; down()
    goto(0,-c)
    goto(-c,-c)
    goto(-c,0)
    goto(0,0)
    pencolor('red')
    goto(-c/2,c)
    goto(-c,0)
    up()

#dessine_maison_absolue(100)


def dessine_oursin(n,c):
    for i in range(n):
        forward(randint(0,c))
        right(randint(0,360))
        up() ; goto(0,0) ; down()

#tracer(False)     
#dessine_oursin(1000,100)

def dessine_montagnes(n,h,l):
    up() ; goto(0,0) ; down()
    for i in range(n):
        goto((i*l)/n,h)
        goto(i,0)
        


#dessine_montagnes(6,50,120)
    


        



mainloop()
