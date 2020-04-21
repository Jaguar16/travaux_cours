##---------------tp 9 -----------------------


##------------Exercice 1------------------##

def affiche(src):
    try :
        f_in = open(src, 'r', encoding='utf-8')
        for ligne in f_in :
            print(ligne,end='')

        f_in.close()
    
    except FileNotFoundError :
        print('Le fichier {} ne peut pas être ouvert en lecture'.format(src))


def recopie(src,dst):
    source =    open(src, 'r', encoding='utf-8')
    try :
        dest   =    open(dst, 'w', encoding='utf-8')

        for ligne in source :
            dest.write(ligne)

        source.close()
        dest.close()

    except PermissionError:
        print('Le fichier {} ne peut pas être ouvert en écriture'.format(dst))




##------------Exercice 2,3------------------##
import shlex


def args_to_filename(args):
    return shlex.split(args)[0]



def starts_with_macro(line,macro):
    return line[:len(macro)+2] == '#' + macro + ' '

def follows_macro(line):
    return line.partition(' ')[2]




def pre_process(f_in,f_out):
    for ligne in f_in:
        print(ligne)
        if ligne[:7]=='#error ' :
            print(follows_macro(ligne))

        #elif starts_with_macro(ligne,'include'):
         #   pre_process(args_to_filename(ligne),f_out)
        
        else :
            f_out.write(ligne)




def pre_process_main(f_name):
    f_in = open(f_name, 'r', encoding='utf-8')
    f_out = open(f_name+ '.preprocessed','w', encoding='utf-8')
    pre_process(f_in,f_out)
    f_in.close()
    f_out.close()




##------------Exercice 3--------------##












