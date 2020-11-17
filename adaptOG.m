%set up the enviornment
clear
clc
warning('off')

%set-up global variables
global count
global mu


%inputs 
%[] =textread('adapt.dat', %f,1);
h = 1;
hbig = 1;
hsmall = 1e-12;
hcut = 2;
hraise = 1.05;
epsilon = 10e-4;
x0 = 1;
y0 = 0;
tfin = 200;
mu =0;


%print confirmation of read in data
fprintf('======== \n');
fprintf('Read in Data: \n');
fprintf('h: %f \n',h);
fprintf('hbig: %f \n',hbig);
fprintf('hsmall: %f \n',hsmall);
fprintf('hcut: %f \n',hcut);
fprintf('hraise: %f \n',hraise);
fprintf('epsilon: %f \n',epsilon);
fprintf('x0: %f \n',x0);
fprintf('y0: %f \n',y0);
fprintf('tfin: %f \n',tfin);
fprintf('mu: %f \n',mu);
fprintf('======== \n');

%call the solver - not needed as we call it each time to graph it
%[Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin);



%error calculation
%PLACEHOLDER



%graphing 
figure(1)
mu = 0
[Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin);
hold on
plot(Tvector, Yvector, 'Linewidth',2,'Color','red');
plot(Tvector, Xvector, 'Linewidth',2,'Color','black');
xlim([150 200])
legend({'Y', 'X'})
title('\mu = 0')
xlabel('t')
ylabel('x & y')
hold off

figure(2)
mu = 0.1
[Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin);
hold on
plot(Tvector, Yvector, 'Linewidth',2,'Color','red');
plot(Tvector, Xvector, 'Linewidth',2,'Color','black');
xlim([150 200])
legend({'Y', 'X'})
title('\mu = 0.1')
xlabel('t')
ylabel('x & y')
hold off

figure(3)
mu = 1
[Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin);
hold on
plot(Tvector, Yvector, 'Linewidth',2,'Color','red');
plot(Tvector, Xvector, 'Linewidth',2,'Color','black');
xlim([150 200])
legend({'Y', 'X'})
title('\mu = 1')
xlabel('t')
ylabel('x & y')
hold off

figure(4)
mu = 10
[Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin);
hold on
plot(Tvector, Yvector, 'Linewidth',2,'Color','red');
plot(Tvector, Xvector, 'Linewidth',2,'Color','black');
xlim([100 200])
legend({'Y', 'X'})
title('\mu = 10')
xlabel('t')
ylabel('x & y')
hold off


%mini-function, allows so you don't have to call adaptive_solver with all
%the variables which are unchanging
function [Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin)
global count
global mu

Tvector = [];
Xvector = [];
Yvector = [];
count = 0;

x = x0;
y = y0;
t = 0;

[h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector, x, y] = adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector,x,y);
fprintf('Results: \n');
fprintf('Final Y: %f \n', y);
fprintf('Final X: %f \n', x);
fprintf('Count: %i \n', count);
fprintf('Steps: %i \n', size(Tvector,1));
fprintf('S: %f \n', (2*size(Tvector,1)/count));
fprintf('======= \n');
end


%main solver function
function [h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector, x, y] = adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector,x,y)

while t+h <= tfin
    [error_approx, xhigh, yhigh] = error_approximation(t,x,y,h);
    if error_approx < epsilon
        Tvector = [Tvector; t];
        Yvector = [Yvector; y];
        Xvector = [Xvector; x];
        y = yhigh;
        x = xhigh;
        t = t+h;
        if h*hraise < hbig
            h = h * hraise;
        end
    else
        while error_approx >= epsilon
            if h/hcut >= hsmall
                h = h/hcut;
            else
                error('Can not compute requested tolerance within supplied minimum step size');
            end
            [error_approx, xhigh, yhigh] = error_approximation(t,x,y,h);
        end
        Tvector = [Tvector; t];
        Yvector = [Yvector; y];
        Xvector = [Xvector; x];
        y = yhigh;
        x = xhigh;
        t = t+h;
    end
end

%checks for how to exit. Either exit with one remaining step, or exit by
%calling the main while loop recursivly with smaller h value if the error
%wasn't acceptable exiting with only one step
if t+h > tfin
    h = tfin - t;
    [error_approx, xhigh, yhigh] = error_approximation(t,x,y,h);
    if error_approx < epsilon
        Tvector = [Tvector; t];
        Yvector = [Yvector; y];
        Xvector = [Xvector; x];
        y = yhigh;
        x = xhigh;
        t = t+h;
    else
        adaptive_solver(h/hcut,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector,x,y);
    end
end
end

%intermediate calculation functions. calculuates xs and ys, along with max
%error

function [error_approx, xhigh, yhigh] = error_approximation(t,x,y,h)
[xprimek0, yprimek0] = vprime(t,x,y);
xlow = x + (h * xprimek0);
ylow = y + (h * yprimek0);
[xprimek1, yprimek1] = vprime(t+h,xlow,ylow);
xprimeavg = (xprimek1 + xprimek0)/2;
yprimeavg = (yprimek1 + yprimek0)/2;
xhigh = x + (h * xprimeavg);
yhigh = y + (h * yprimeavg);
xerror_approx = abs(xhigh - xlow);
yerror_approx = abs(yhigh - ylow);
error_approx = max(xerror_approx, yerror_approx);
end

