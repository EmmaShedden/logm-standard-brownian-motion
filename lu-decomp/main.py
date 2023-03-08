import numpy as np

# LU decomposition of an nxm matrix M
def lu(M, n, m):
    L = np.identity(n, dtype=float)
    U = np.copy(M)
    for j in range(min(n, m)): # iterate over cols
        for i in range(j+1, min(n, m)): # iterate over rows
            if U[j][j] == 0:
                raise Exception("Matrix requires permutation")
            k = U[i][j] / U[j][j]
            L[i][j] = k
            U[i] -= k*U[j]
    return L, U

# Solve MX=Y for X, where M is nxn lower triangular
def solve_lower(M, Y, n):
    X = np.zeros(n, dtype=float)
    for i in range(n): # iterate over rows
        # sum{j < i} M[i][j] * X[j] + M[i][i] * X[i] = Y[i]
        X[i] = Y[i] - np.sum(M[i] * X)
    return X

# Solve MX=Y for X, where M is nxm upper triangular
def solve_upper(M, Y, n, m):
    X = np.zeros(m, dtype=float)
    for i in range(min(n, m)-1, -1, -1): # iterate over rows backwards
        # sum{j > i} M[i][j] * X[j] + M[i][i] * X[i] = Y[i]
        num = Y[i] - np.sum(M[i] * X)
        if M[i][i] == 0 and num == 0:
            print("Infinite solutions: X[{}] can be anything".format(i))
        elif M[i][i] == 0 and num != 0:
            raise Exception("Inconsistent system")
        else:
            X[i] = num / M[i][i]
    
    # if the matrix is tall (n > m), we must check the rest of the rows
    # for consistency with our solution
    for i in range(m, n):
        if not np.allclose(M[i] * X, Y[i]):
            raise Exception("Inconsistent system")
    
    return X

def main():
    # example
    M = np.array([[6, 18, 3], [2, 12, 1], [4, 15, 3]], dtype=float)
    L, U = lu(M, 3, 3)
    Y = np.array([3, 19, 0], dtype=float)
    W = solve_lower(L, Y, 3)
    X = solve_upper(U, W, 3, 3)
    assert(np.allclose(np.matmul(M, X), Y))
    print("done")

    # tests
    N = 100
    for i in range(1000):
        n = np.random.randint(3, 10)
        m = np.random.randint(n-1, n+3)
        M = np.random.randint(-N, N, size=(n, m)).astype(float)
        L, U = lu(M, n, m)
        assert(np.allclose(np.matmul(L, U), M))
        Y = np.random.randint(-N, N, size=(n,)).astype(float)
        W = solve_lower(L, Y, n)
        assert(np.allclose(np.matmul(L, W), Y))
        X = solve_upper(U, W, n, m)
        assert(np.allclose(np.matmul(U, X), W))
        assert(np.allclose(np.matmul(M, X), Y))
        print("done {}".format(i))

main()