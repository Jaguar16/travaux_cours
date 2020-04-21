def max_abs(x,y):
    if abs(x)>abs(y): return x
    elif abs(x)==abs(y):
        return abs(x)
    return y

def print_max_abs(x,y,s):
    print(s, max_abs(x,y))




