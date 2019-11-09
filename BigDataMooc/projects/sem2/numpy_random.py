from numpy import random
import matplotlib.pyplot as plt

r1 = random.random_sample((3, 3))
print(r1)

r2 = random.standard_normal((4, 4))  # gauss
print(r2)

a = random.standard_normal(10000)
hh = plt.hist(a, 40)
# plt.show()

C = random.standard_normal((50, 50))
print(C.shape)
plt.imshow(C, interpolation='nearest')
plt.colorbar()
plt.show()
