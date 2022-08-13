function [df] = dif_cen(x, h)
df =(fx(x + h) - fx(x - h))/( (x + h) - (x - h))

%erel = abs(dif_cen(3,1) - fxlinha(3))/abs(dif_cen(3,1)) * 100