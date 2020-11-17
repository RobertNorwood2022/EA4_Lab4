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
[t,XsolAs] = ode15s(@prime,t,Xa0, options);
xas = XsolAs(:,1);
fprintf('--Equation 1-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xas));
fprintf('Final x: %10.10f \n', xas(length(xas)));

%solution for B
count = 0;
martix = B;
options = odeset('RelTol',relative_tolerance_2);
[t, XsolBs] = ode15s(@prime,t,Xb0, options);
xbs = XsolBs(:,1);
fprintf('--Equation 2-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xbs));
fprintf('Final x: %10.10f \n', xbs(length(xbs)));


%graphing -- make sure to run ode45stiff FIRST
