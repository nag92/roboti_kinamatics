clear all
clc
syms theta_1 theta_2 theta_3 l_1 l_2
%link1 = [ 0 90 0 theta_1];
link2 = [ l_1 0 0 theta_2];
link3 = [ l_2 0 0 theta_3];

A = getA([link2;link3]) ;
T = getT(A);

T_solve = double(subs(T, [l_1, l_2,theta_2 theta_3], [1, 1, 45, 45]));
plotArm(T_solve);

[o, On] = getO(T);

z = getZ(T);

j1 = getRevJ(z(:,1),On,o(:,1));
j2 = getRevJ(z(:,2),On,o(:,2));
%j3 = getRevJ(z(:,3),On,o(:,3));
simplify( j1)



%%
m_1 = [ 2*eye(3), zeros(3);...
       zeros(3), 5*eye(3)]

m_2 = [ 3*eye(3), zeros(3);...
        zeros(3), 6*eye(3)];

J = getLinkJacobian(T)

temp = J(:,:,1)'*m_1*J(:,:,1) 


