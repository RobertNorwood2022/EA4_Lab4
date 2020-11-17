%ode45stiff

%set up environment
clc


%set values
global A
global B
global count
global matrix
Xa0 = [1 2 3];
Xb0 = [1 2 3];
tfin = 2;
t = [0 tfin];
relative_tolerance_1 = 5e-6;
relative_tolerance_2 = 1.5e-5;

%solution for A
count = 0;
matrix = A;
options = odeset('RelTol',relative_tolerance_1);
[tas,XsolAs] = ode15s(@prime,t,Xa0, options);
xas = XsolAs(:,1);
fprintf('--Equation 1-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xas));
fprintf('Final x: %10.10f \n', xas(length(xas)));

%solution for B
count = 0;
martix = B;
options = odeset('RelTol',relative_tolerance_2);
[tbs, XsolBs] = ode15s(@prime,t,Xb0, options);
xbs = XsolBs(:,1);
fprintf('--Equation 2-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xbs));
fprintf('Final x: %10.10f \n', xbs(length(xbs)));


%graphing -- make sure to run ode45stiff FIRST

%create functions for exact soln
xAE = @(t) c1*(scaled_evec_A(1,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(1,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(1,3) * exp(evalA(3) * t));
xBE = @(t) c1*(scaled_evec_B(1,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(1,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(1,3) * exp(evalB(3) * t));
%figure 1a
figure(1)
hold on
title('Figure 1a')
plot(ta, xa,'r.','Markersize',15);
plot(tas, xas,'g.','Markersize',15);
fplot(xAE, [0 2], 'black', 'Linewidth',2);
xlim([0 0.1]);
legend({'ode45', 'ode15a','Exact'})
xlabel('t');
ylabel('x(t)');
hold off;

%figure 1b
figure(2)
hold on
title('Figure 1b');
plot(ta, xa,'r.','Markersize',15);
plot(tas, xas,'g.','Markersize',15);
fplot(xAE, [0 2], 'black', 'Linewidth',2);
xlim([0 2]);
legend({'ode45', 'ode15a','Exact'})
xlabel('t');
ylabel('x(t)');
hold off;

%figure 2
figure(3)
hold on
title('Figure 2');
plot(tb, xb,'r.','Markersize',15);
plot(tbs, xbs,'g.','Markersize',15);
fplot(xBE, [0 2], 'black', 'Linewidth',2);
xlim([0 2]);
legend({'ode45', 'ode15a','Exact'})
xlabel('t');
ylabel('x(t)');
hold off;