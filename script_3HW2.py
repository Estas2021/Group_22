# Сделать скрипт используя функцию input().
# 1. Функция должна на вход принимать целое число.
# 2. Внутри функции должно сгенерироваться 2 рандомных целых числа (import random)...(random.randint(1, 100))
# 3. Выводить должна "Вы вели число = (введённое число) которое (меньше/больше/равно и меньше/больше/равно) сгенерированному числу"

user_int = int(input("Введите число: "))

import random
some_int, some_int1 = random.randint(1, 100), random.randint(1, 100)
print("Ваши сгенерированные числа:", some_int, some_int1)

if some_int < user_int and some_int1 < user_int:
    print("Вы ввели число =", user_int, ",которое больше", some_int, "и больше", some_int1)
elif some_int == user_int and some_int1 > user_int:
    print("Вы ввели число =", user_int, ",которое равняется", some_int, "и меньше", some_int1)
elif some_int1 > user_int and some_int == user_int:
    print("Вы ввели число =", user_int, ",которое меньше", some_int1, "и равняется", some_int)
elif some_int > user_int and some_int1 > user_int:
    print("Вы ввели число =", user_int, ",которое меньше", some_int, "и меньше", some_int1)
elif some_int1 < user_int or some_int > user_int:
    print("Вы ввели число =", user_int, ",которое больше", some_int1, "и(или) меньше", some_int)
elif some_int > user_int or some_int1 < user_int:
    print("Вы ввели число =", user_int, ",которое меньше", some_int, "и(или) больше", some_int1)
elif some_int < user_int or some_int1 > user_int:
    print("Вы ввели число =", user_int, ",которое больше", some_int, "и(или) меньше", some_int1)