import csv


def is_aries(m, d):
    # Aries is March 21 - April 19
    if m == 3 and d in range(21, 32):
        return True
    elif m == 4 and d in range(1, 20):
        return True
    return False


def is_yod(y):
    if (y in range(1910, 1912)
            or y in range(1922, 1924)
            or y in range(1934, 1936)
            or y in range(1946, 1948)
            or y in range(1958, 1960)
            or y in range(1970, 1972)
            or y in range(1982, 1984)
            or y in range(1994, 1996)
            or y in range(2006, 2008)
            or y in range(2018, 2020)):
        return True
    return False


def lives_nearby(hood):
    return hood == 'South Ozone Park, NY 11420'


with open('../../data/noahs-customers.csv', mode='r') as cust_file:
    reader = csv.reader(cust_file)
    next(reader)
    for line in reader:
        year, month, day = [int(x) for x in line[4].split('-')]
        neighborhood = line[3]
        if is_aries(month, day) and is_yod(year) and lives_nearby(neighborhood):
            print(line)
