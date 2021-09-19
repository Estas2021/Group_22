some_str = "34"
some_str1 = "43"

q = 3
w = 7
e = 13
r = 44

s_fl = 3.1
s_fl1 = 5.5
s_fl2 = 0.3

if q > 2:
    print("Q больше двух")

if not w < 6:
    print("Да, w больше двух")

if e != 12:
    print("Дe")

if r == 44:
    print("r = 44")

if q >= 3:
    print("Q больше или равно 3")

if w == 7:
    print("W = 7")

if w >= 7:
    print("W >= 7")

if w != 8:
    print("W  ne = 8")

if e == 13:
    print("E == 13")

if not e > 100:
    print("E greater than 100")

if e <= 14:
    print("E lesser than 14")

if not r < 26:
    print("R > 26")

if r > 36:
    print("R > 36")

sravnenie = w > q
print(sravnenie)

sravnenie1 = e < r
print(sravnenie1)

#  Реализовать 9 варианта сравнения Float переменных с операторами >, <, >=, <=, !=. Pезультаты весвести в консоль.
compare_fl1 = s_fl > s_fl2
print(compare_fl1)

compare_fl2 = s_fl2 < s_fl
print(compare_fl2)

compare_fl3 = s_fl >= s_fl2
print(compare_fl3)

compare_fl4 = s_fl2 <= s_fl
print(compare_fl4)

compare_fl5 = s_fl1 != s_fl2
print(compare_fl5)

compare_fl6 = s_fl1 == s_fl2
print(compare_fl6)

compare_fl7 = s_fl1 > s_fl
print(compare_fl7)

compare_fl8 = s_fl < s_fl1
print(compare_fl8)

compare_fl9 = s_fl1 != s_fl2
print(compare_fl9)

# Реализовать 10 варианта сравнения int переменных с операторами >, <, >=, <=, !=
# и условными выражениями (end, or, not). Pезультаты весвести в консоль.

a = 3
b = 7
c = 13
d = 44

if a < b or b < a:
    print("1")

if a < b and b < c:
    print("2")

if a < b and not b > c:
    print("3")

if a < b and b < d:
    print("4")

if a < b and b != c:
    print("Половина!")

if a < b < c and c > b:
    print("6")

if a < b < c and not c < b:
    print("7")

if c < d or b > a:
    print("8")

if d != c or c > b:
    print("Еще немного!")

if not d <= c or c > b:
    print("10")

# Сделать скрипт используя функцию input().
# 1. Функция должна на вход принимать целое число.
# 2. Выводить должна "Вы вели число = (введённое число) которое (меньше/больше/равно) 30"

user_int = int(input("Введите число: "))
if user_int < 30:
    print("Вы ввели число =", user_int, "которое меньше 30")
elif user_int > 30:
    print("Вы ввели число =", user_int, ",которое больше 30")
elif user_int == 30:
    print("Вы ввели число =", user_int, ",которое равняется 30")
