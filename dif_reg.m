function [df] = dif_reg(x, h) 
df = (fx(x) - fx(x - h))/( x - (x - h))

%Como executar: dif_reg(1,0.01)
