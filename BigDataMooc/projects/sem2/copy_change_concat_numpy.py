import numpy as np

A = np.array([[1, 3], [4, 2]])
print(A)

B = A  # assignation not copy
print(B)
B[0, 0] = 10
print(B)
print(A)

C = np.array([[1, 4], [3, 2]])
D = C.copy()  # copy
D[0, 1] = 10
print(C)
print(D)

print("=====")
E = np.array([[1, 2], [3, 4]])
n, m = E.shape
print(E)
print(n, m)
F = E.reshape((n * m,))
G = E.reshape((n * m, 1))
print(F.shape)
print(F)
print(G.shape)
print(G)

print(np.tile(E, (1, 2)))  # 1 time by row, 2 times by column
print(np.tile(E, (2, 1)))
print(np.tile(E, (2, 2)))

H = np.array([[5, 6]])
print(np.concatenate((E, H), axis=0))
print(np.concatenate((E, H.T), axis=1))
print(H.T)
print(np.vstack((E, H)))
print(np.hstack((E, H.T)))
