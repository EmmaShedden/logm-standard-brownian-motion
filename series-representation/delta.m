function out = delta(t) %original function Delta(t)
  flag1 = [0 <= t, t < 1/2];
  flag2 = [1/2 <= t, t <= 1];
  if all(flag1>0)
      out = 2*t;
  elseif all(flag2>0)
      out = 2*(1-t);
  else
      out = 0;
  end
end