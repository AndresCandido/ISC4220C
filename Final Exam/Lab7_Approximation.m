% Lab 7 - Approximation

%-----------------------------------
%  Least Squares Approximation

%A=[0; 0.25; 0.5; 0.75; 1];
%b = [2.1; 3.7; 6.27; 10.03; 16.31];
%r = A\b
%-----------------------------------

% part a and b
M = readmatrix('weather.txt');

numOfDays = M(:,1);
HighTemp = M(:,2);
Lowtemp = M(:,3);

AvgTemp = (HighTemp+Lowtemp)/2;

x = (2*pi*numOfDays)/365;
A = vander(x);

THat = x.\AvgTemp;
THatMean = sum(THat)/(2*pi);

plot(x,AvgTemp,x,THat);

Tmean = sum(AvgTemp)/365;


