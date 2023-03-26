N = 128; %number of summands
lambda = @(n) (1/2) * 2^(-largest(n)/2); %compute lambda as a function of n
lambda_n = zeros(1,N); 
for n = 1 : N
  lambda_n(n) = lambda(n); %compute lambda_n at each n
end
x = linspace(0,1,1000);
y = zeros(1,1000);
z = randn(1,N+1);
for i = 1 : length(x)
    s = zeros(1,N);
    for j = 1 : N
         s(j) = lambda_n(j)*z(j)*delta((2^largest(j))*x(i)-(j-2^largest(j)));
     end
     y(i)=sum(s)+z(N+1)*1*x(i);
 end
plot(x,y); %plot the graph
