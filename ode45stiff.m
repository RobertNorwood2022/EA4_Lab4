%ode45stiff

%set up environment
%clc


%set values
global A
global B
global count
global matrix
Xa0 = [1 2 3];
Xb0 = [1 2 3];
tfin = 2;
t = [0 tfin];
relative_tolerance_1 = 1.75e-4;
relative_tolerance_2 = 1.5e-4;

%solution for A
count = 0;
matrix = A;
options = odeset('RelTol',relative_tolerance_1);
[ta,XsolA] = ode45(@prime,t,Xa0, options);
xa = XsolA(:,1);
fprintf('--Equation 1-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xa));
fprintf('Final x: %10.10f \n', xa(length(xa)));

%solution for B
count = 0;
martix = B;
options = odeset('RelTol',relative_tolerance_2);
[tb, XsolB] = ode45(@prime,t,Xb0, options);
xb = XsolB(:,1);
fprintf('--Equation 2-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xb));
fprintf('Final x: %10.10f \n', xb(length(xb)));
