some_str = "32"
some_int = 32
some_float = 32.3
some_byte = bytes('bytes', encoding = 'utf-8')
list = [1, 2.0, 'hello']                                    #список
tuple = (4, 5, 3, True, 3.2, 'str')                         #кортежи
num = {1, 2, 3, 4, 4, 2, 1, 0}                              #множества
new_num = frozenset([4,6,2,89,8,6,True,89, 567, 'hello'])   #замороженное множество: свойства множества&кортежей
s1 = {'ключ' : 'значение', 'яблоко' : 'яблоня', 'клюв' : 'птица', 'банан' : 'пальма', 'подарок' : 'жене'} #словари

print(type(some_str))
print(type(some_int))
print(type(some_float))
print(type(some_byte))
print(type(list))
print(type(tuple))
print(type(num))
print(type(new_num))
print(type(s1))

a ='hellp'
b ='world'
c = a + b
print(c)

int = 12
int1 = 5
int2 = int + int1
print(int2)

int3 = int / int1
print(int3)

int3 = int * int1
print(int3)

int3 = int // int1
print(int3)

int3 = int % int1                       # ты этого хотел?:D
print(int3)
