% Lab 9 - Integration

% Part 1:

X = 0:1/4:1;
Y = sqrt(X).*log(X);
Y(1,1) = 0; % in this specific case make Y(1,1) = 0, because log(0)= NaN
Q = trapz(X,Y)
true = -4/9;

