# Series Representation Algorithm

## Mathematical Fundation
Source: [_Brownian Motion_, J. Michael Steele](https://link.springer.com/chapter/10.1007/978-1-4684-9305-4_3)

### Theorem 3.1
```math
\text{If} \quad \{Z_n : 0 \le n <\infty\} \quad \text{is a sequence of Gaussian random variables with mean 0 and variance 1, then the series defined by}\\
X_t = \sum\limits_{n=0}^{\infty} \lambda_n Z_n \Delta_n(t)\\
\text{converges uniformly on [0,1] with probability one. Moreover, the process} \quad \{X_t\} \quad \text{defined by the limit is a standard Brownian motion for} \quad 0 \le t \le 1.
```
in which 
```math
\lambda_n = \frac{1}{2}2^{-j/2} \quad \text{where} \quad n \ge 1 \quad \text{and} \quad n = 2^j + k \quad \text{with} \quad 0 \le k < 2^j.\\
\Delta(t) = \begin{cases}
2t & 0 \le t < \frac{1}{2}\\
2(1-t) & \frac{1}{2} \le t < 1\\
0 & \text{otherwise}
\end{cases}\\
\Delta_n(t) = \Delta(2^j t - k) \quad \text{for} \quad n = 2^j + k, \quad \text{where} \quad i \ge 0 \quad \text{and} \quad 0 \le k < 2^j
```

## Realization

### Remark
- We only simulate $X_t$ for finite summands
