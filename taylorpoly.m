function p=taylorpoly(f,n,a=0)
%
% Entrada:
% f - função (no formato function_handle)
% n - grau de polinômio resultante
% a - ponto de expanção (opcional), se for omitido é 0
%
% Saida:
% p - polinômio de grau n
%
% Exemplo:
% Polinômio de Taylor de grau 4 de função f(x) = exp(x) em volta de 1
%   p = taylorpoly(@(x) exp(x),4,1)
%
  pkg load symbolic;
  syms x;
  fsym=f(x);
  tn=function_handle(taylor(fsym, 'expansionPoint', a, 'order', n+1));
end
