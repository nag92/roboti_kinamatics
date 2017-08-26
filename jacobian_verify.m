clear all
clc
syms theta_1 theta_2 theta_3 l_1 l_2

link1 = [ l_1 0 0 theta_1];
link2 = [ l_2 0 0 theta_1];

A = getA([link1;link1]) ;
T = getT(A);

T_solve = double(subs(T, [l_1, l_2, theta_1 theta_2], [1, 1, 45, 45]));
plotArm(T_solve);

[o,On] = getO(T);

z = getZ(T);

j1 = getRevJ(z(:,1),On,o(:,1));
j2 = getRevJ(z(:,2),On,o(:,2));
%j3 = getRevJ(z(:,3),On,o(:,3));

J_a = simplify([j1 j2]);

J_b = simplify(getJacobian(T));



J = getLinkJacobian(T)

m_1 = [ 2*eye(3), zeros(3);...
       zeros(3), 5*eye(3)]

m_2 = [ 3*eye(3), zeros(3);...
        zeros(3), 6*eye(3)];
    
m(:,:,1) = m_1;
m(:,:,2) = m_2;


getInteriaMatrix(J,m)


%subs(J,[theta_1,theta_2], [0,45]);
%%
% x1 = [ l1*cos(t1(t));...
%        l1*sin(t1(t))];
% 
% x2 = [ x1(1) + l2*cos(t1(t) + t2(t));...
%        x1(2) + l2*cos(t1(t) + t2(t))];
% %%   
% % Get the link 2 positions and velocityT
% 
% x1 = [ l_1*cos(t1(t));...
%        l_1*sin(t1(t))];
% 
% x2 = [ x1(1) + l_2*cos(t1(t) + t2(t));...
%        x1(2) + l_2*cos(t1(t) + t2(t))];
%    
% x1_d = diff(x1,t);
% x1_d = subs(x1_d, {diff(t1(t), t) }, {t1d(t)})
% 
% 
% x2_d = diff(x2,t);
% 
% x2_d = subs(x2_d, {diff(t2(t), t) }, {t2d(t)})
% 


