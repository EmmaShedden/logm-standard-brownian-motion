# LU Decomposition

## Mathematical Fundation
Source: [_LU Decomposition_](https://www.math.ucdavis.edu/~linear/old/notes11.pdf)

Each nonsigular square matrix can be diagonalized by row operations and column operations (i.e. exists a lower triangular matrix L', a upper
triangular matrix U' s.t. L' * A * U' = D in which D is a diagonal matrix)
Given that the inverse of a lower triangular matrix is still a lower triangular matrix, so does upper triangular matrix, $L'^{-1}$ is the desired
lower triangular matrix for LU decomposition and D * $U'^{-1}$ is the desired upper triangular matrix

### Remark
For each i, we want to use A(i,i) to zeros out the ith row and the ith column respectively\
No worries for A(i,i) = 0 since all the leading principal submatrices are nonsingular, once A(i,i) zeros out the ith row and the ith column, the (i+1)th leading principal submatrix is all zeros except for the diagonal consisting of A(1,1) - A(i+1,i+1). All former operations can be viewed as row, column operations on the (i+1)th leading principal submatrix which won't affect the nonsingularity, therefore, A(i+1,i+1) $\neq$ 0 
