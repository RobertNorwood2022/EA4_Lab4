%ode45stiff

%set up environment
clear 
clc


%set values
A = [196.5 1.5 -199; 200.5 -2.5 -199; 396.5 1.5 -399];
B = [.5 .5 -2; 2.5 -1.5 -2; 3.5 .5 -5];
Xa0 = [1 2 3]';
Xb0 = [1 2 3]';
tfin = 2;
relative_tolerance_1 = 1.75e-4;
relative_tolderance_2 = 1.5e-4;