import random
import math

#Напишите скрипт, который преобразует введенное с клавиатуры вещественное число в денежный формат. Например, число 12,5 должно
#быть преобразовано к виду «12 руб. 50 коп.». В случае ввода отрицательного числа выдайте сообщение «Некорректный формат!»
#путем обработки исключения в коде. --1

def convert_to_money(num):
    try:
        if num>=0: print(int(num), "руб.", round(num%1*100), "коп.") 
        else: raise Exception
    except Exception:
      print("Некоректный формат")

convert_to_money(float(input("Введите число: ")))

#Написать скрипт, который выводит на экран «True», если элементы программно задаваемого списка представляют собой возрастающую
#последовательность, иначе – «False». --2

def check_increase(list):
    print(False not in (list[i] < list[i+1] for i in range(len(list)-1)))

check_increase([10, 12, 35, 41, 56])

#Напишите скрипт, который позволяет ввести с клавиатуры номер дебетовой карты (16 цифр) и выводит номер в скрытом виде: первые и
#последние 4 цифры отображены нормально, а между ними – символы «*» (например, 5123 **** **** 1212). --3

def hide_numbers(nums):
    print(nums[:4], "**** ****", nums[12:]) if len(nums)==16 else print("Должно быть 16 цифр")

hide_numbers(input("Введите номер дебетовой карты(без пробелов): ")) #"5123456823981212"

#Напишите скрипт, который разделяет введенный с клавиатуры текст на слова и выводит сначала те слова, длина которых превосходит 7
#символов, затем слова размером от 4 до 7 символов, затем – все остальные. --4

def output_word(words):
   words.sort(key=len, reverse=True)
   print(" ".join(words))

output_word(input("Введите предложение: ").split())

#Напишите скрипт, который позволяет ввести с клавиатуры текст предложения и сформировать новую строку на основе исходной, в
#которой все слова, начинающиеся с большой буквы, приведены к верхнему регистру. Слова могут разделяться запятыми или пробелами.
#Например, если пользователь введет строку «город Донецк, река Кальмиус», результирующая строка должна выглядеть так: «город
#ДОНЕЦК, река КАЛЬМИУС». --5

def up_word(words):
    print(" ".join(i.upper() if i[0].isupper() else i for i in words))

up_word(input("Введите предложение: ").split())

#Напишите программу, позволяющую ввести с клавиатуры текст предложения и вывести на консоль все символы, которые входят в этот
#текст ровно по одному разу. --6

def check_frequency(sentence):
    print(" ".join(i for i in sentence if sentence.count(i)==1))

check_frequency(input("Введите предложение: "))

#Напишите скрипт, который обрабатывает список строк-адресов следующим образом: сначала определяет, начинается ли каждая строка
#в списке с префикса «www». Если условие выполняется, то скрипт должен вставить в начало этой строки префикс «http://», а затем
#проверить, что строка заканчивается на «.com». Если у строки другое окончание, то скрипт должен вставить в конец подстроку «.com». В
#итоге скрипт должен вывести на консоль новый список с измененными адресами. Используйте генераторы списков. --7

def change_address(list):

    output_list = [i + ".com" if not i.endswith('.com') else i for i in ["http://" + i if i.startswith('www.') else i for i in list]]
    print("\n".join(output_list))

change_address(["www.tttt.com","nnn.com","www.bbbbb","www.hht", "www.tllt.com"])

#Напишите скрипт, генерирующий случайным образом число n в
#диапазоне от 1 до 10000. Скрипт должен создать массив из n целых
#чисел, также сгенерированных случайным образом, и дополнить
#массив нулями до размера, равного ближайшей сверху степени двойки.
#Например, если в массиве было n=100 элементов, то массив нужно
#дополнить 28 нулями, чтобы в итоге был массив из 28 = 128 элементов
#(ближайшая степень двойки к 100 – это число 128, к 35 – это 64 и т.д.). --8

def generate_array():
    n = random.randrange(1, 10000)
    array = [random.randint(1,100) for i in range(0,n)]
    new_size = 2**math.ceil(math.log2(len(array)))
    for i in range(n,new_size):
        array.append(0)
    print(n, new_size)
   
generate_array()

#Напишите программу, имитирующую работу банкомата. Выберите структуру данных для хранения купюр разного достоинства в заданном
#количестве. При вводе пользователем запрашиваемой суммы денег, скрипт должен вывести на консоль количество купюр подходящего
#достоинства. Если имеющихся денег не хватает, то необходимо напечатать сообщение «Операция не может быть выполнена!».
#Например, при сумме 5370 рублей на консоль должно быть выведено «5*1000 + 3*100 + 1*50 + 2*10». --9

def imitation_bank(money):

    bank_money = {1000: 7, 500: 4, 100: 8, 50: 4, 10: 2}
    output_money = []

    for value, quantity in bank_money.items():
        if money < value * quantity and quantity != 0:
            quantity = money//value
            
        output_money.append((quantity, value))
        money -= value * quantity
        bank_money[value] -= quantity
     
    if money!=0:
        print("Операция не может быть выполнена!")

    [print(f"{i}*{j}", end=" ") for i, j in output_money if money == 0]
    

imitation_bank(int(input("Введите сумму: ")))

#Напишите скрипт, позволяющий определить надежность вводимого пользователем пароля. Это задание является творческим: алгоритм
#определения надежности разработайте самостоятельно. --10

def validation(password):
    if len(password)>9 and not password.isdigit() and password.startswith('!'):
        print("Пароль надёжный")
    else:
        print("Плохой пароль!")


validation(input("Введите пароль: "))
