clear all
close all
clc

syms th_1 th_2 th_3 th_4 th_5 th_6  
dist = 1.100328*0.5;
a_l = [dist,0, -0.612, -0.5723, 0, 0, 0];
a_r = [-dist,0, -0.612, -0.5723, 0, 0, 0];
d = [0,0.1273, 0, 0, 0.163941, 0.1157, 0.0922];
alpha =[0,1.570796327, 0, 0, 1.570796327, -1.570796327, 0];
theta = [0,th_1 th_2 th_3 th_4 th_5 th_6];
%theta = [ 0 0 0 0 0 0 ]

%links = [];

for i=1:6
    left(i,:) = [a_l(i), alpha(i), d(i), theta(i)];
    right(i,:) = [a_r(i), alpha(i), d(i), theta(i)];
end

T_l = getT(getA(left));
T_r = getT(getA(right));

n = 100*100*100*50;
points_right = zeros(n,3);
points_left = zeros(n,3);

hold on
plotArm(double(subs(T_r,[th_1 th_2 th_3 th_4 th_5 th_6],[0 -pi/2 0 -pi/2 0 0])))
plotArm(double(subs(T_l,[th_1 th_2 th_3 th_4 th_5 th_6],[0 -pi/2 0 -pi/2 0 0])))
full_cycle = linspace(0,2*pi,4);
full_cycle = linspace(-pi,pi,4);

T_l = T_l(1:3,4,end);
T_r = T_r(1:3,4,end);
%%
count = 0;
for i = full_cycle
    for j = full_cycle
        for k = full_cycle
            for l = full_cycle
                count = count +1;
                right = double(subs(T_r,[th_1 th_2 th_3 th_4 th_5 th_6],[i j-pi/2 k l-pi/2 0 0]));
                left = double(subs(T_l,[th_1 th_2 th_3 th_4 th_5 th_6],[i j-pi/2 k l-pi/2 0 0]));
                points_left(count,:) = left';
                points_right(count,:) = right' ;
                %plot3(x_r(end),y_r(end),z_r(end),'gx','LineWidth',8);
                %plot3(x_l(end),y_l(end),z_l(end),'bx','LineWidth',8);
            end
        end
    end
end

plot3(points_right(:,1),points_right(:,2),points_right(:,3),'bx','LineWidth',8)
plot3(points_left(:,1),points_left(:,2),points_left(:,3),'gx','LineWidth',8)


                
                    


