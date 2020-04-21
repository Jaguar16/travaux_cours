####---------TD5--------









###-------Exercice 1 ---------

### 1) (1,2) + (3,4) vaut (1,2,3,4)

### 2)
def vect_sum2(x,y):         ## Fonction qui fait la somme de 2 vecteurs de dimension 2  --//-- renvoie un tuple
    return (x[0]+y[0],x[1]+y[1])

##print('vect_sum2((1,2),(3,4)) =',vect_sum2((1,2),(3,4)))


def vect_dim(v):              ### Fonction qui nous renvoie la longeur de v donc la dimension du vecteur  --//-- renvoie un int
    return len(v)

def vect_sum(x,y):            ###Fonction qui fait la somme de 2 vecteurs de même dimension   --//-- renvoie une liste
    sum_vect = []
    if vect_dim(x) == vect_dim(y) :
        for i in range(vect_dim(x)) :
            sum_vect = sum_vect + [x[i] + y[i]]

        return sum_vect

    return ' Les vecteurs ne sont pas de même dimension'

##print('vect_sum((1,2,4),(3,4,5)) =',vect_sum((1,2,4),(3,4,5)))
##print('vect_sum((1,2,4,8),(3,4,5,3)) =',vect_sum((1,2,4,8),(3,4,5,3)))




            
##-------Exercice 2------------

def find_alpha(s):            ## Fonction qui renvoie le la position et le caractère de la première lettre --//-- renvoie un tuple
    for i in range(len(s)) :
        if s[i].isalpha() :
            return (i,s[i])

##print('find_alpha('12356abd') Nous renvoie (5,'a') normalement : ',find_alpha('12356abd'))





##---------Exercice 3----------------------------

def moyenne(L):
    moy = 0
    for i in range(len(L)) :
        moy = moy + L[i]

    return moy/len(L)


##print('moyenne([20,40]) = 'moyenne([20,40]))



##---------------Exercice 4 -------------------------------------




g_f = ('pierre', 'feuille', 'ciseaux')


def f(s) :
    global g_f
    return g_f.index(s)

def g(x):
    global g_f
    return g_f[x]

##print("f('pierre') =", f('pierre') )
##print("f('feuille') =", f('feuille') )
##print("f('ciseaux') =", f('ciseaux') )


##print("g(0) =", g(0) )
##print("g(1) =", g(1) )
##print("g(2) =", g(2) )




##------------Exercice 5 ---------------------------------


def new_periodic_list(l,p):
    periodic_list = []
    for i in range(l) :
        periodic_list.append(i%p)

    return periodic_list

##print('new_periodic_list(10,3) =', new_periodic_list(10,3))


def padding(l,pattern):
    padding_list = []
    for i in range(l) :
        padding_list.append(pattern[i % len(pattern)])

    return padding_list

##print('padding(10,[1,2,3]) =', padding(10,[1,2,3]))


##------------------Exercice 6 ----------------------------

def est_triee(L):
    for i in range(len(L)-1):
        if L[i] >= L[i+1] :
            return False

    return True


##print('est_triee([1,9,12,47]) :', est_triee([1,9,12,47]))
##print('est_triee([1,9,7,47]) :', est_triee([1,9,7,47]))



##-------------------Exercice 7 ---------------------------------------


def grouper(L):
    group = [L[0]]
    
    for i in range(1,len(L)):
        if L[i] != L[i-1] :
            group.append(L[i])

    return group


print('grouper([1,2,6,6,6,8,8,8,9,9,9,1,1,3,3] =',grouper([1,2,6,6,6,8,8,8,9,9,9,1,1,3,3]))
print('grouper([4,4,4,2,2,4]) =',grouper([4,4,4,2,2,4]))            



def compacter(L):
    ##return [ [].append((L.count(L[i]), grouper(L)[i])) for i in range(len(L))]
    
    grouper_L= grouper(L)
    compact = [1] * len(grouper_L)
    Len_L = len(L)


    for j in range(len(grouper_L)):
        i = 1
        while i <= len(L) :
            print(i)
            ##if i == len(L)-1 : break
            if L[i] == L[i-1] :
                compact[i] = compact[i] + 1
                i += 1

            else : L = L[i:] ; i = 1


    return [ (compact[i], grouper_L[i]) for i in range(len(grouper_L))]


            

compacter([4,4,4,2,2,4])
##



