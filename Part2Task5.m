%set up the enviornment
clear
clc
warning('off')

%set-up global variables
global count
global K

%inputs 
%[] =textread('adapt.dat', %f,1);
h = 1;
hbig = 1;
hsmall = 1e-12;
hcut = 2;
hraise = 1.05;
epsilon = 0.01;
u0 = 0.3;
v0 = 0.3;
tfin = 50;
K = 0.25; 
ustar = 0.8;
vstar = 0.4;



%print confirmation of read in data
fprintf('======== \n');
fprintf('Read in Data: \n');
fprintf('h: %f \n', h);
fprintf('hbig, hsmall: %f, %d \n', hbig, hsmall);
fprintf('hcut, hraise: %f, %f \n', hcut, hraise);
fprintf('epislon: %f \n', epsilon);
fprintf('tfin: %f \n', tfin);
fprintf('K: %f \n', K);
fprintf('u*, v*: %f %f \n', ustar, vstar);
fprintf('u0,v0: %f %f \n', u0, v0);
fprintf('======== \n');



%call the solver - not needed as we call it each time to graph it
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);

%graphing!
%figures 3a-3c
figure(1)
hold on
K = 0.25;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3a: K = 0.25');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

figure(2)
hold on
K = 1;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3b: K = 1');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

figure(3)
hold on
K = 2.5;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3c: K = 2.5');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

%figures 3d-3f
ustar = .8;
vstar = .9;
u0= 1;
v0 = 0.3;

figure(4)
hold on
K = 0.25;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3d: K = 0.25');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

figure(5)
hold on
K = 1;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3e: K = 1');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

figure(6)
hold on
K = 2.5;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 3f: K = 2.5');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

%figures 4a-d
figure(7)
hold on
ustar = 0.4;
vstar = 0.4;
K = 1;
u0 = 0.35;
v0 = 0.25;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 4a: K = 1, (u0,v0)=(0.35,0.25), (u*,v*)=(0.4,0.4)');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off

figure(8)
hold on
ustar = 0.4;
vstar = 0.4;
K = 1;
u0 = 0.25;
v0 = 0.35;
[Tvector, Uvector, Vvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,u0,v0,tfin, ustar, vstar);
title('Figure 4b: K = 1, (u0,v0)=(0.25,0.35), (u*,v*)=(0.4,0.4)');
plot(Tvector, Uvector, 'linewidth', 2, 'Color', 'black');
plot(Tvector, Vvector, 'linewidth', 2, 'Color', 'red');
ylim([-0.025 1.025]);
xlim([0 50]);
xlabel('Time');
ylabel('u and v');
legend({'u', 'v',})
hold off


%mini-function, allows so you don't have to call adaptive_solver with all
%the variables which are unchanging
%because I don't want to rename the variables. x=u, y=v
function [Tvector, Xvector, Yvector] = real_adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, ustar, vstar)
global count
global alpha
global beta

alpha = (1 - ustar)/(vstar);
beta = (1 - vstar)/(ustar);

Tvector = [];
Xvector = [];
Yvector = [];
count = 0;

x = x0;
y = y0;
t = 0;

[h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector, x, y] = adaptive_solver(h,hbig,hsmall,hcut,hraise,epsilon,x0,y0,tfin, t, Tvector, Xvector, Yvector,x,y);
fprintf('Results: \n');
fprintf('Alpha: %f \n', alpha);
fprintf('Beta: %f \n', beta);
fprintf('Final v: %f \n', y);
fprintf('Final u: %f \n', x);
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
[xprimek0, yprimek0] = uvprime(t,x,y);
xlow = x + (h * xprimek0);
ylow = y + (h * yprimek0);
[xprimek1, yprimek1] = uvprime(t+h,xlow,ylow);
xprimeavg = (xprimek1 + xprimek0)/2;
yprimeavg = (yprimek1 + yprimek0)/2;
xhigh = x + (h * xprimeavg);
yhigh = y + (h * yprimeavg);
xerror_approx = abs(xhigh - xlow);
yerror_approx = abs(yhigh - ylow);
error_approx = max(xerror_approx, yerror_approx);
end

