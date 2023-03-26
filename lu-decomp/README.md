# MATLAB 
## USAGE
- Call function `[L,U] = LU_decomposition(A)` in the command window in which `A` is a nonsingular square matrix
- The resulting L is the lower triangular matrix and U is the upper triangular matrix for the LU decomposition of A 

## EXAMPLE
Input:\
A=
```math
\begin{pmatrix}
6 & 18 & 3 \\
2 & 12 & 1 \\
4 & 15 & 3 \\
\end{pmatrix}
```
Output:\
L=
```math
\begin{pmatrix}
1 & 0 & 0 \\
\frac{1}{3} & 1 & 0 \\
\frac{2}{3} & \frac{1}{2} & 1 \\
\end{pmatrix}
```
U=
```math
\begin{pmatrix}
6 & 18 & 3 \\
0 & 6 & 0 \\
0 & 0 & 1 \\
\end{pmatrix}
```
