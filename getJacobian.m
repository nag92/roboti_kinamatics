function [ j ] = getJacobian( T )

    n = length(T(1,1,:))
    
    [o,On] = getO(T);

    z = getZ(T);
    
    for ii = 1:n
        j(:,ii) = getRevJ(z(:,ii),On,o(:,ii));
    end

end

