
syms theta_1 theta_2 theta_3

links = []
link1 = [ 0 90 0 0]
link2 = [ 1 0 0 theta_2]
link3 = [ 1 0 0 theta_3]

A = getA([link1;link2;link3]) 
T = getT(A)

T_solve = double(subs(T, [theta_1,theta_2,theta_3], [0,45,0]))
plotArm(T_solve)