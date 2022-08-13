function x = secante(f,x0,x1,epsilon)
%
% Entrada:
% f - função (no formato function_handle)
% x0, x1 - pontos iniciais
% epsilon - critério de parada
%
% Saida:
% x - zero da função
%
% Exemplo:
% Zero de função f(x) = exp(x)-2, usando pontos iniciais
% x0=3.5 e x1=3.2, com precisão 10^(-6):
%   x = secante(@(x)exp(x)-2, 3.5,3.2, 1.e-6)

xold = x0;
x = x1;
fxold = f(xold);
fx = f(x);
i=0;
dx = x-xold;
e_rel = abs(1-xold/x);

fprintf('\n\nMétodo da secante:\n');
fprintf('x_%i = %14.6e  f(x_%i) = %14.6e\n',i,x,i,fx);

while(e_rel > epsilon)
  g = (fx-fxold)/dx; %calcula a inclinação da secante
  xold = x;    % guarda o ponto anterior
  fxold = fx;  % guarda o valor de f no ponto anterior
  x=x-fx/g;    % passo da secante
  dx = x - xold; % distância entre passos
  e_rel = abs(1-xold/x); % erro relativo entre o passo atual e passo anterior
  fx = f(x);   % atualiza valor de f no no ponto x
  i = i+1;     % atualiza o número de iterações
  fprintf('x_%i = %14.6e  f(x_%i) = %14.6e  e_rel = %14.6e\n',i,x,i,fx,e_rel);
end
