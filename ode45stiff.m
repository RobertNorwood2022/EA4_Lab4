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
x_err = 100 * ((XsolA(length(XsolA),1) - XA(1))/(XA(1)));
y_err = 100 * ((XsolA(length(XsolA),2) - XA(2))/(XA(2)));
z_err = 100 * ((XsolA(length(XsolA),3) - XA(3))/(XA(3)));
fprintf('Max Error: %f \n', max([x_err, y_err, z_err]));
fprintf('Final x: %10.10f \n', xa(length(xa)));

%solution for B
count = 0;
matrix = B;
options = odeset('RelTol',relative_tolerance_2);
[tb, XsolB] = ode45(@prime,t,Xb0, options);
xb = XsolB(:,1);
fprintf('--Equation 2-- \n');
fprintf('Count: %i \n', count);
fprintf('nsteps: %i \n', length(xb));
x_err = 100 * ((XsolB(length(XsolB),1) - XB(1))/(XB(1)));
y_err = 100 * ((XsolB(length(XsolB),2) - XB(2))/(XB(2)));
z_err = 100 * ((XsolB(length(XsolB),3) - XB(3))/(XB(3)));
fprintf('Max Error: %f \n', max([x_err, y_err, z_err]));
fprintf('Final x: %10.10f \n', xb(length(xb)));
