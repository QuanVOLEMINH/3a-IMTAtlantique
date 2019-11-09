import numpy as np
import matplotlib.pyplot as plt

M = np.array([[1, 3], [2, 4], [5, 9]])
print(M)
print(M[0, 0])
print(M[1, 0])
print(type(M))
print(M.shape)
print(M.ndim)
print(M.dtype)
print(M.itemsize)
print(M.nbytes)
print(M.size)
M[0, 0] = -10
print(M)

a = np.array([0, 0, 0])
print(a.dtype)
a[0] = 3.2
print(a)

b = np.array([0, 0, 0], dtype=np.float)
b[0] = 3.4
print(b)

c = a.astype(float)
print(c)

print(c.astype(bool))

print(np.arange(0, 10, 2))

x = np.linspace(-10, 10, 100)
y = np.sin(x)

plt.plot(x, y, label='y = sin(x)')
plt.legend(loc='upper right')
plt.show()
