import numpy as np
from numpy import random

data = np.genfromtxt('data.csv', delimiter=',')
# print(data)
# print(data.shape)

M = random.standard_normal((3, 3))
# print(M)
# np.savetxt('random-data.csv', M, fmt=' % 2.3f', delimiter=',')
# np.save('random-matrix.npy', M)
N = np.load('random-matrix.npy')

print(N)
print(N[1, :][1:3])
