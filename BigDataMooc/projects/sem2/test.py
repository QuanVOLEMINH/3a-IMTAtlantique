import numpy as np
import matplotlib.pyplot as plt

v = np.array([1, 3, 2, 4])
x = np.array([0, 2, 4, 6])

plt.figure()
plt.plot(x, v, 'g--', label='vector')
plt.xlabel('x')
plt.ylabel('y')
plt.title('example title')
plt.legend(loc='lower right')
plt.show()

print(v.shape)
print(x.shape)
