function [ output_args ] = getInertiaMatrix( J,inertia )
%GETD Summary of this function goes here
%   Detailed explanation goes here

    
    M = J(:,:,1)'*inertia(:,:,1)*J(:,:,1);
    
    
    
    for ii = 2:length(J(1,1,:))
        ii
        M = M + J(:,:,ii)'*inertia(:,:,ii)*J(:,:,ii)
    end


end

