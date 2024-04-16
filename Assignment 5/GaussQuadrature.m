
% Defining number of nodes
n=4;

I = gauss(@f,n)

% Defining function
function funct = f(x)           
funct = 1./(exp(x)+exp(-x));
end

% (n+1)-pt Gauss quadrature of f
function I = gauss(f,n)
% 3-term recurrence coeffs
beta = .5./sqrt(1-(2*(1:n)).^(-2));
% Jacobi matrix
T = diag(beta,1) + diag(beta,-1);
[V,D] = eig(T); % eigenvalue decomposition
x = diag(D);
[x,i] = sort(x); % nodes (= Legendre points)
w = 2*V(1,i).^2; % weights
I = w*feval(f,x); % the integral
end