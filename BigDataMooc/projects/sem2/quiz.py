import numpy as np
import matplotlib.pyplot as plt
x = np.linspace(0, 5, 100)
y = x ** 2
plt.plot(x, y)
plt.show()

v = np.array([0,2,4,6])
print(len(v))
print(v.ndim)
print(v.shape)
print(v[1] == 0)

a = np.array([ [0, 2], [4, 6]], dtype=np.float64)
print(type(a))
print(a.ndim)
print(a.size)
print(a.itemsize)
print(a.nbytes)
print('-------')
M = np.array([ [0, 2], [4, 6]])
r = M[0, :]
a = r[1]
print(r)
print(a)

print('---------')
y = np.array([0, 0, 0, 1, 1, 1], dtype=np.float64)
y1 = y[y == 1]
y[y < 1] = -1.0
print(y1)
print(y)
print(type(y[0]))

a = np.ones((5, 5))
v = np.dot(a, np.ones(5))

print(a)
print(v)
print(np.diag(a))
print(a.size)


a = np.arange(20)
print(a)
a = a.reshape(4, 5)
print(a)
print(np.max(a))
print(np.min(a))
print(np.min(a, axis=0))
print(a[:,0])
