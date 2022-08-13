%Diferença progressiva
function [df]= dif_prog(x,h)
df = (fx(x + h) - fx(x))/( (x + h) - x)

%Cálculo do erro:
% Calcula a derivada da função dada
% abs(dif_cen fx - fx') / abs(dif_cen fx) * 100


%Considere a fun ?c ?aof(x) =x3.  Calcule numericamente a derivada primeira no 
%pontox= 3 aplicandoas f ?ormulas de diferen ?cas finitas

%executando:  dif_prog(1,0.01)

