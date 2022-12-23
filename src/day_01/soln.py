import csv

def char_to_digit(c):
    if (c in 'ABC'):
        return '2'
    elif (c in 'DEF'):
        return '3'
    elif (c in 'GHI'):
        return '4'
    elif (c in 'JKL'):
        return '5'
    elif (c in 'MNO'):
        return '6'
    elif (c in 'PQR'):
        return '7'
    elif (c in 'STU'):
        return '8'
    elif (c in 'VWX'):
        return '9'
    else:
        return '0'

def string_to_number(name):
    r = ''
    for c in name:
        r += char_to_digit(c)
    return r


with open('../../data/noahs-customers.csv', mode = 'r') as file:
    reader = csv.reader(file)
    for d in reader:
        number = d[5]
        slim_number = number.replace('-', '')
        name = d[1].split(" ")

        last = name.pop()
        if (last == 'Jr.' or last == 'Sr.'):
            last = name.pop()
        elif (last == 'II' or last == 'III' or last == 'IV' or last == 'V'):
            last = name.pop()

        if (len(slim_number) == len(last)):
            x = string_to_number(last.upper())
            if (x == slim_number):
                print(number)
