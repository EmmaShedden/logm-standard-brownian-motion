function out=largest(n) %compute j s.t. n=2^j+k 0<= k <2^j
  flag1 = [n == fix(n), n >= 1];  
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