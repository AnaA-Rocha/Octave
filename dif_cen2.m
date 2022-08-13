function [df] = dif_cen2(x, h)
df =(fx(x-h) - 2*fx(x) + fx(x+h))/(h^2)

%Considere a fun ?c ?aof(x) = (2xx).  Calcule numericamente a 
%derivada segunda no pontox= 2 aplicandoa f ?ormula de diferen ?ca 
%central com trˆes pontos

%Como executar: dif_cen2(1,0.01)
%erel = abs(dif_cen2(1,0.01) - fxlinha(1))/abs(dif_cen2(1,0.01)) * 100