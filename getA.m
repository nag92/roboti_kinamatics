function [ A ] = getA( links)
%Nathniel Goldfarb 2/3/14
%getA returns the Ai matrix for a basic DH matrix
%   link 1X4 matrix to containg 
%a = link(1): link length;
%alpha = link(2): link twist(in dergees);
%d = link(3): link offset;
%theta = link(4): joint angle (in degree);


for ii = 1:length(links(:,1))
    
    a= links(ii,1);
    alpha=links(ii,2);
    d=links(ii,3);
    theta=links(ii,4);
    

   
    A(:,:,ii) = [ cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta);
                 sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
                     0           sin(alpha)             cos(alpha)            d;
                     0            0                     0                      1];
    
end


%{
a= link(1);
alpha=link(2);
d=link(3);
theta=link(4);


alpha = degtorad(alpha);
theta = degtorad(theta);

A = [ cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta);
      sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
      0           sin(alpha)             cos(alpha)            d;
      0            0                     0                      1];
  

%}
end

