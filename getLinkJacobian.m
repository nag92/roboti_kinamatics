function [ J ] = getLinkJacobian( T )
%GETLINKJACOBIAN Summary of this function goes here
%   Detailed explanation goes here
    
    n = length(T(1,1,:));
    J = zeros(6,n);
    
    for ii=1:n
       
        T_current = T(:,:,1:ii);
        temp = getJacobian(T_current);
        
        if ii == n
            J(:,:,ii) = temp;
        else
            J(:,:,ii) = [temp, zeros(6,n-ii)];
        end
        
    end
        
end

