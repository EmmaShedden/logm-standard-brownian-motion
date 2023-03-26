% Algorithm:
% 1. We refer to the expression X_t = \sum_{n=0}^{\infty} \lambda_n * Z_n *
% \Delta_n(t) in which \lambda_n is a constant as a funtion of n, Z_n is a
% standard Gaussian variable, \Delta_n(t) is a function of t differ by n
% 2. We only simulate X_t for finite summands
% 3. We dicretize the time interval [0,1] and only simulate X_t on a set of
% timestamps
% 4. We draw the plot of X_t with respect to t

% Require: 
% Effect: Simulate the standard Brownian motion with N summands 
function simulation(N)

lambda = @(n) (1/2) * 2^(-largest(n)/2); % Compute lambda as a function of n
lambda_n = zeros(1,N); 
for n = 1 : N
  lambda_n(n) = lambda(n); % Compute lambda_n for each n
end

x = linspace(0,1,1000); % Dicretize the interval [0,1]
y = zeros(1,1000); % Variable y records the results of the summations at each x
Z = randn(1,N+1); % Generate a standard Gaussin vector

for i = 1 : length(x)
    summand = zeros(1,N);
    for j = 1 : N
         summand(j) = lambda_n(j) * Z(j) * delta((2^largest(j)) * x(i)-(j-2^largest(j)));
         % Compute each summand
     end
     y(i) = sum(summand)+Z(N+1) * 1 * x(i);
end
plot(x,y); % Plot the graph
end
