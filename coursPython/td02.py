def fact(n):
    if n == 0 :
        return 1

    return fact(n-1) * n

print(fact(5))


def facto(n) :
    res = 1
    while n >= 1 :
        res = res * n
        n = n-1
    return res


def print_facts(n):
    for i in range(1,n+1):
        print(facto(i))
        
