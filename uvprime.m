function [uprime, vprime] = uvprime(t,u,v)
global count
global alpha
global beta
global K
count = count + 1;
uprime = u * (1 - u - (alpha * v));
vprime = (K * v)*(1 - v - (beta * u));
end
