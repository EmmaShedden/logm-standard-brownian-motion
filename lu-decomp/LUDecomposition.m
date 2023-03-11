function [L,U] = LUDecomposition(A)
%Implement LU Decomposition
%Call function:[L,U]=LUDecomposition(A)

%Require : nonsingular square matrix
%Effect : if A has LU decomposition, return L,U; else return L,U as
%"undefined"

sz=size(A);
verify = 1; %test whether A has LU decomposition
for i = 1 : sz(1)
    B = A(1:i,1:i);
    if det(B) == 0
        verify = 0;
    end
end 

%LU factorization of a nonsingular matrix exists if and only if all leading 
% principal submatrices are nonsingular.

if verify ~= 0 
    E=diag(ones(1,sz(1)));%record all row operation matrices
    R=diag(ones(1,sz(1)));%record all column operation matrices
    for i = 1 : sz(1)-1
        S=diag(ones(1,sz(1)));%record one row operation matrix
        X=diag(ones(1,sz(1)));%record one column operation matrix
        %no worry A(i,i)=0
        %since all leading principal submatrices are nonsingular, after
        %A(i,i) zeros out the ith row and ith column, the (i+1)th leading
        %principal submatrix is all zeros except the diagonal being A(1,1)-
        %A(i+1,i+1)
        %all former operations can be viewed as row, column operations on
        %the (i+1)th leading principal submatrix which won't affect the
        %nonsingularity, therefore A(i+1,i+1) ~= 0 
        for j = i+1 : sz(1)
            Z=diag(ones(1,sz(1)));%record a single row operation step matrix
            Z(j,i) = -A(j,i)/A(i,i);
            S(j,i) = -A(j,i)/A(i,i);
            A = Z * A;%row operation
        end
        for j = i+1 : sz(1)
            Y=diag(ones(1,sz(1)));%record a single column operation step matrix
            Y(i,j) = -A(i,j)/A(i,i);
            X(i,j) = -A(i,j)/A(i,i);
            A = A * Y;%column operation
        end
        E = cat (3,E,S);%merge all row operation matrices
        R = cat (3,R,X);%merge all column operation matrices
    end
    L = inv(E(:,:,sz(1)));
    U = A/(R(:,:,sz(1)));
    for i = sz(1)-1 : 2
        L = E(:,:,i)\L;
        U = U/R(:,:,i);
    end
else
    L = "undefined";
    U = "undefined";
end
end