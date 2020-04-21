from turtle import *
from math import *

##x = 1
##y = 2
##z = 3
##
##def f(x):
##    global y
##    x = x + 1
##    y = y + 1
##    z = x + y
##
##f(x)
##
##print(x,y,z)
##
##

is_down = True
xt = 0
yt = 0
cap = 0


def draw_line(x1,y1,x2,y2):
    up() ; goto(x1,y1) ; down()
    goto(x2,y2)



def Forward(d):
    global xt
    global yt
    global cap
    global is_down
    newx = xt + d *cos(cap*pi/180)
    newy = yt + d* sin(cap* pi/180)
    if is_down :
        draw_line(xt, yt, newx,newy)

    xt = newx
    yt = newy



def Left(angle):
    global cap
    cap = cap + angle


def Up():
    global is_down
    is_down = False


def Down():
    global is_down
    is_down = True


    

Up() ; Forward(-100) ; Down() ; Forward(200) ; Up() ; Left(90) ; Forward(100)
Left(90) ; Down() ; Forward(200)

    

    






##ht()
##draw_line(-100,-50,100,-50)
##draw_line(-100,50,100,50)
    

