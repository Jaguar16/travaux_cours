from fr_dic import fr_dic


def vingts_premiers_mots():
    for i in range(20):
        print(i, fr_dic[i], len(fr_dic[i]))
    
L = [len(fr_dic[i]) for i in range(len(fr_dic))]

def max_L():
    maxi = L[0]
    for i in range(len(L)):
        if L[i] > maxi :
            maxi = L[i]
    return maxi

def mots_plus_long():
    maxi = max_L()
    for word in fr_dic :
        if len(word) == maxi :
            print(word)



##mots_plus_long()
