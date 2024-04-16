% Golden Section Search Method
clear all
clc

lowerx = 0;
upperx = 5;
tol= 0.000001;
MinOrMax = -1;

optima = GoldenSectionSearch(lowerx, upperx, tol, @f, MinOrMax);
disp(optima);

function funct = f(c)           
funct = (2*c)/(4+(0.8*c)+(c^2)+(0.2*c^3));
end

function Xopt = GoldenSectionSearch(lowerx, upperx, tol, f, MinOrMax) 

Xopt = 0; Error = 1; phi = 1.61803398874989; Iter = 0; 
goldenR = (phi - 1) * (upperx - lowerx); % calculate golden ratio

if (MinOrMax == -1 ) %here we are able to change whether we find the minimum (1) or maximum (-1)
	coef = -1;
elseif (MinOrMax == 1)
    coef = 1;
end

x1 = lowerx + goldenR;
x2 = upperx - goldenR;

while (Error > tol)   % runs loop while the error is greater than the stablished tolerance

    Iter = Iter+1;
	if (coef * (f(x1)) < coef * (f(x2)))  %GoldenSectionSearch occurs in if / else statement
        lowerx = x2;
		x2 = x1;
		goldenR = (phi - 1) * (upperx - lowerx); %update golden ratio
		x1 = lowerx + goldenR;
		Xopt = x1; %update xopt
    else
        upperx = x1;
		x1 = x2;
		goldenR = (phi - 1) * (upperx - lowerx); % update golden ratio
		x2 = upperx - goldenR;
		Xopt = x2; % update xopt
    end
    Error(Iter) = (2 - phi) * abs((upperx - lowerx) / Xopt); % update error
end
x = 1:Iter;
semilogy(x,Error,'-')
grid on
end