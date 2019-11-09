import csv
import numpy as np
s = (4898, 11)
a = np.zeros(s)
y = np.zeros((4898, 1))
with open('winequality-white.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=';')
    header = next(spamreader)
    i = 0
    for row in spamreader:
        print(i)
        temp = np.array([float(x) for x in row[:len(row) - 1]])
        print(temp)
        y[i] = float(row[-1])
        a[i] = temp
        i = i + 1
# print(i)
a_tran = np.transpose(a)
coe = np.linalg.inv(a_tran.dot(a)).dot(a_tran)
beta = coe.dot(y)
r = a.dot(beta) - y
r1 = r**2
# print(y)
print(coe.shape)
print(beta)
print(r)
print(r1)
print(sum(r1))