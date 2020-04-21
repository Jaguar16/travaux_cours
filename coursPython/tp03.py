
##Exercice 2
##chaine = '\nå€'
##for c in chaine :
##    print(c)
##    for system in [('ascii'),('iso-8851-1'),'utf-8'] :
##        try :
##            rep = bytearray(chaine.encode(system))
##            print('en',system,'sur',len(rep),'octets : premier octet', rep[0])
##        except :
##            print('ne se code pas en ', system)






## Exercice 3


##def code_cesar(msg,k):
##    code = ''
##    for c in msg :
##        if c.isupper() :
##            ord_c = ord(c)
##            car = chr(ord_c+k) % 26
##            code = code + car
##        else : code = code + c
##
##    return(code)


def code_cesar(msg,k):
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    code = ''
    for c in msg :
        if c.isupper() :
            for i in  range(len(alphabet)) :
                if c == alphabet[i] :
                    car = alphabet[(i+k)%26]
            code = code + car
        else : code = code + c

    return(code)







def decode_cesar(msg,k):
    code = ''
    for c in msg :
        if c.isupper() :
            ord_c = ord(c)
            car = chr((ord_c - k) % 26)
            code = code + car
        else : code = code + c

    return(code)
            

print(code_cesar('ENVOYEZ 36 HOMMES !',3))
print(decode_cesar('HQYR\H] 36 KRPPHV !',3))

##for i in range(25):
##    print(decode_cesar('JLGVI XRJFZC',i))



## Exercice 4

##
##def table_ascii():
##    for i in range(32, 127):
##        print(i, chr(i))
##
##table_ascii()
##
