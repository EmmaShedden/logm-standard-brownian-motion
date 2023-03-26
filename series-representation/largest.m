% Effect: Compute the largest j with respect to n 
% s.t. n = 2^j + k and 0 <= k < 2^j
function out = largest(n) 
  flag1 = [n == fix(n), n >= 1]; % Test if n is an integer and n >= 1
                                 % otherwise, we set the output to be 0
  if all(flag1>0)
      i = 0;
      while i <= n
        flag2 = [0 <= n - 2^i, n - 2^i < 2^i]; 
        if all(flag2>0)
          out= i;
          break
        end
        i = i+1;
      end
  else
      out = 0;
  end
end