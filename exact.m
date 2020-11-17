%Lab4 Part I

%set enviornment
clc
clear
format long 
format compact


%define the given variables
global A
global B
A = [196.5 1.5 -199; 200.5 -2.5 -199; 396.5 1.5 -399];
B = [.5 .5 -2; 2.5 -1.5 -2; 3.5 .5 -5];
Xa0 = [1 2 3]';
Xb0 = [1 2 3]';



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
fprintf('Eqn 1: \n')
xA = c1*(scaled_evec_A(1,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(1,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(1,3) * exp(evalA(3) * t));
yA = c1*(scaled_evec_A(2,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(2,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(2,3) * exp(evalA(3) * t));
zA = c1*(scaled_evec_A(3,1) * exp(evalA(1) * t)) + c2*(scaled_evec_A(3,2) * exp(evalA(2) * t)) + c3*(scaled_evec_A(3,3) * exp(evalA(3) * t));
XA = [xA yA zA]'

%solutions at t=2 for B
t = 2;
c = scaled_evec_B \ Xb0;
c1 = c(1);
c2 = c(2);
c3 = c(3);
format long
fprintf('Eqn 2: \n')
xB = c1*(scaled_evec_B(1,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(1,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(1,3) * exp(evalB(3) * t));
yB = c1*(scaled_evec_B(2,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(2,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(2,3) * exp(evalB(3) * t));
zB = c1*(scaled_evec_B(3,1) * exp(evalB(1) * t)) + c2*(scaled_evec_B(3,2) * exp(evalB(2) * t)) + c3*(scaled_evec_B(3,3) * exp(evalB(3) * t));
XB = [xB yB zB]'
