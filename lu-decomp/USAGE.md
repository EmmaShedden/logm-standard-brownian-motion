# MATLAB 
## USAGE
- Call function `[L,U] = LU_decomposition(A)` in the command window in which `A` is a nonsingular square matrix
- The resulting L is the lower triangular matrix and U is the upper triangular matrix for the LU decomposition of A 

## EXAMPLE
Input:\
A=
```math
\begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9 \\
\end{pmatrix}
```
Output:\
L=
```math
\begin{pmatrix}
1 & 0 & 0 \\
4 & 1 & 0 \\
7 & 2 & 1 \\
\end{pmatrix}
```
U=
```math
\begin{pmatrix}
1 & 2 & 3 \\
0 & -3 & -6 \\
0 & 0 & 0 \\
\end{pmatrix}
```
