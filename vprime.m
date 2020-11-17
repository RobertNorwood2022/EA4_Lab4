function [xprime, yprime] = vprime(t,x,y)
global mu
global count
xprime = y;
yprime = (mu * (1-x^2) * y) - x;
count = count + 1;
end
