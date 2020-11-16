%Lab4 Part I

%set enviornment
clc
clear
format long


%define the given variables
A = [196.5 1.5 -199; 200.5 -2.5 -199; 396.5 1.5 -399];
B = [.5 .5 -2; 2.5 -1.5 -2; 3.5 .5 -5];
Xa0 = [1 2 3]';
Xb0 = [1 2 3]';


%solve using built in dsolve to check work
fprintf('Computed solutions using dsolve: \n');
syms x(t) y(t) z(t)
X = [x;y;z];
odesA =diff(X) == A*X;
cond = X(0) == Xa0;
[xsolA(t), ysolA(t), zsolA(t)] = dsolve(odesA,cond);


syms x(t) y(t) z(t)
X = [x;y;z];
odesB = B*X;
cond = X(0) == Xa0;
[xsolB(t), ysolB(t), zsolB(t)] = dsolve(odesA,cond);

%find when t=2
fprintf('t=2 for equation 1:')
[double(xsolA(2));double(ysolA(2));double(zsolA(2))]

fprintf('t=2 for equation 2:')
[double(xsolB(2));double(ysolB(2));double(zsolB(2))]

%calculate eigenvalue and eigenvectors 
format short
[evecA, evalA] = eig(A);
[evecB, evalB] = eig(B);


fprintf('Eigenvalues for A: \n');
evalA = eig(A)

fprintf('Eigenvalues for B: \n');
evalB = eig(B)

fprintf('Scaled Eigenvector for A: \n');
scaled_evec_A = [evecA(:,1)./evecA(1) evecA(:,2)./evecA(1,2) evecA(:,3)./evecA(1,3)]

fprintf('Scaled Eigenvector for B: \n');
scaled_evec_B = [evecB(:,1)./evecB(1) evecB(:,2)./evecB(1,2) evecB(:,3)./evecB(1,3)]


%solutions at t=2 for A
t = 2;
c = scaled_evec_A \ Xa0;
c1 = c(1);
c2 = c(2);
c3 = c(3);
format long
xA = c1*(scaled_evec_A(1,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(1,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(1,2) * exp(evalA(3) * t));
yA = c1*(scaled_evec_A(2,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(2,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(2,2) * exp(evalA(3) * t));
zA = c1*(scaled_evec_A(3,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(3,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(3,2) * exp(evalA(3) * t));
X = [xA yA zA]'

%solutions at t=2 for B
t = 2;
c = scaled_evec_B \ Xb0;
c1 = c(1);
c2 = c(2);
c3 = c(3);
format long
xB = c1*(scaled_evec_B(1,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(1,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(1,2) * exp(evalB(3) * t));
yB = c1*(scaled_evec_B(2,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(2,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(2,2) * exp(evalB(3) * t));
zB = c1*(scaled_evec_B(3,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(3,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(3,2) * exp(evalB(3) * t));
X = [xB yB zB]'
