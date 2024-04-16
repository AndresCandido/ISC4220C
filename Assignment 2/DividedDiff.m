
clear all;
clc;

X = [1 2 3 4 5];
Y = [1 1 2 6 21];

myDD = divdiff(X, Y);
my = myDD(:,1).';    % make useful results into a row vector for plotting

matlabDD = interp1(X,Y,"spline"); %matlab built-in interpolation

fplot(@gamma) % plot gamma function and the found polys (mine and matlab's overlap)R
hold on
plot(X,Y,'o',X,my,':.');
plot(X,Y,'o',X,matlabDD,':.');
hold off

function TDD = divdiff(X, Y)
    if nargin ~= 2
        error('divdiff: invalid input parameters'); 
    end
    [ p, m ] = size(X); % m points, polynomial order <= m-1
    if p ~= 1 || p ~=size(Y, 1) || m ~= size(Y, 2)
        error('divdiff: input vectors must have the same dimension'); 
    end
    TDD = zeros(m, m);
    TDD(:, 1) = Y';
    for j = 2 : m
        for i = 1 : (m - j + 1)
            TDD(i,j) = (TDD(i + 1, j - 1) - TDD(i, j - 1)) / (X(i + j - 1) - X(i));
        end
    end
end