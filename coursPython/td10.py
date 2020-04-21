##----------------TD 10-------------------
from tkinter import *


root = Tk()
root.resizable(False,False)
largeur = 100
hauteur = 400
canvas = Canvas(root, width=largeur, height= hauteur, bg='yellow')
root.resizable(False,False)


x = 50
y = 100
dy = 0
r = 20
GRAV = 0.5
FROT = 1
canvas.create_oval(x-r,y-r,x+r,y+r,outline='black',fill='red',width=2)

def dessiner():
    canvas.delete(ALL)
    canvas.create_oval(x-r,y-r,x+r,y+r,outline='black',fill='red',width=2)

def suivant():
    global y
    global dy
    if y+r >= hauteur :
        dy = -dy+GRAV
    else :
        dy = dy + GRAV
    y = y +dy

def final():
    return False

def animation():
    if not final():
        dessiner()
        suivant()
        canvas.after(10,animation)
    else :
        print('Done')



animation()
canvas.pack()


