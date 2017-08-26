
syms theta_1 theta_2 theta_3 l_1 l_2
link1 = [ 0 90 0 theta_1];
link2 = [ l_1 0 0 theta_2];
link3 = [ l_2 0 0 theta_3];

A = getA([link1;link2;link3]) ;
T = getT(A);

T_solve = double(subs(T, [l_1, l_2, theta_1, theta_2 theta_3], [1, 1, 0, 45, 45]));
plotArm(T_solve);

[o,On] = getO(T);

z = getZ(T);

j1 = getRevJ(z(:,1),On,o(:,1));
j2 = getRevJ(z(:,2),On,o(:,2));
j3 = getRevJ(z(:,3),On,o(:,3));

J = [j1 j2 j3];
simplify(j1)

%subs(J,[theta_1,theta_2], [0,45]);
%%
x1 = [ l1*cos(t1(t));...
       l1*sin(t1(t))];

x2 = [ x1(1) + l2*cos(t1(t) + t2(t));...
       x1(2) + l2*cos(t1(t) + t2(t))];
%%   
% Get the link 2 positions and velocity
syms t1(t) t2(t) t1d(t) t2d(t) 

x1 = [ l_1*cos(t1(t));...
       l_1*sin(t1(t))];

x2 = [ x1(1) + l_2*cos(t1(t) + t2(t));...
       x1(2) + l_2*cos(t1(t) + t2(t))];
   
x1_d = diff(x1,t);
x1_d = subs(x1_d, {diff(t1(t), t) }, {t1d(t)})


x2_d = diff(x2,t);

x2_d = subs(x2_d, {diff(t2(t), t) }, {t2d(t)})



