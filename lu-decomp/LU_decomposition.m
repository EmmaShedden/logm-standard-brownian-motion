% Algorithm:
% 1. Each nonsigular square matrix can be diagonalized by row operations and
% column operations (i.e. exists a lower triangular matrix L', a upper
% triangular matrix U' s.t. L' * A * U' = D)
% 2. Given that the inverse of a lower triangular matrix is still a lower
% triangular matrix, so does upper triangular matrix, L'^{-1} is the desired
% lower triangular matrix for LU decomposition and D * U'^{-1} is the
% desired upper triangular matrix

% Require : A is a nonsingular square matrix 
% Effect : if A has LU decomposition, return the lower triangular matrix L
% and the upper triangular matirx U; otherwise, return L,U as "undefined"
function [L,U] = LU_decomposition(A)

sizeA = size(A);
hasLUDecop = 1; % 1 for A has LU decomposition; 0 for A doesn't has LU decomposition

% LU decomposition of a nonsingular matrix exists if and only if all leading 
% principal submatrices are nonsingular.
for i = 1 : sizeA(1)
    B = A(1:i,1:i);
    if det(B) == 0
        hasLUDecop = 0; 
    end
end 

if hasLUDecop == 1 
    rowOperMat = diag(ones(1,sizeA(1))); % Record all row operation matrices
    colOperMat = diag(ones(1,sizeA(1))); % Record all column operation matrices
    for i = 1 : sizeA(1)-1
        % For each i, we want to use A(i,i) to zeros out the ith row and
        % ith column respectively

        % No worries for A(i,i) = 0 since all the leading principal submatrices 
        % are nonsingular, once A(i,i) zeros out the ith row and the ith co
        % lumn, the (i+1)th leading principal submatrix is all zeros except
        % for the diagonal consisting of A(1,1) - A(i+1,i+1).
        % All former operations can be viewed as row, column operations on
        % the (i+1)th leading principal submatrix which won't affect the
        % nonsingularity, therefore, A(i+1,i+1) ~= 0 
        rowMat = diag(ones(1,sizeA(1))); % Record row operation matrix for each i
        colMat = diag(ones(1,sizeA(1))); % Record column operation matrix for each i
        
        for j = i+1 : sizeA(1)
            tempRow = diag(ones(1,sizeA(1))); 
            tempRow(j,i) = -A(j,i)/A(i,i); % Row operation matrix
            rowMat(j,i) = -A(j,i)/A(i,i); % Record the operation
            A = tempRow * A; % Zeros out a specific element at (j,i)
        end

        for j = i+1 : sizeA(1)
            tempCol = diag(ones(1,sizeA(1))); 
            tempCol(i,j) = -A(i,j)/A(i,i); % Column operation matrix
            colMat(i,j) = -A(i,j)/A(i,i); % Record the operation
            A = A * tempCol; % Zeros out a specific element at (i,j)
        end

        rowOperMat = cat (3,rowOperMat,rowMat); % Merge all row operation matrices
        colOperMat = cat (3,colOperMat,colMat); % Merge all column operation matrices
    end

    L = inv(rowOperMat(:,:,sizeA(1))); % Compute the inverse of the last row operation matrix
    U = A/(colOperMat(:,:,sizeA(1))); % Compute the product of the diagonal matrix and the 
                                      % inverse of the last column operation matrix

    for i = sizeA(1)-1 : 2
        L = rowOperMat(:,:,i)\L; % Multiply L by the inverse of the row operation matrix on by one
        U = U/colOperMat(:,:,i); % Multiply U by the inverse of the column operation matrix on by one
    end
else
    L = "undefined";
    U = "undefined";
end
end