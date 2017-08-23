function  [xPlot,yPlot, zPlot]= getPoints( T )
%GETPOINTS Summary of this function goes here
%   Detailed explanation goes here

    x = squeeze(T(1,4,:));
    y = squeeze(T(2,4,:));
    z = squeeze(T(3,4,:));
    N = 3;
    x = round(x',N);
    y = round(y',N);
    z = round(z',N);

    xPlot = [0 x];
    yPlot = [0 y];
    zPlot = [0 z];

end

