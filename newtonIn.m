function x = newton(f,df,x0,epsilon)
%
% Entrada:
% f - função (no formato function_handle)
% df - derivada de f (no formato function_handle)
% x0 - ponto inicial
% epsilon - critério de parada
%
% Saida:
% x - zero da função
%
% Exemplo:
% Zero de função f(x) = exp(x)-2 (derivada: f'(x)=exp(x)), usando ponto
% inicial x0=3.5 e precisão 10^(-6):
%   x = newton(@(x)exp(x)-2,@(x)exp(x), 3.5, 1.e-6)

x = x0;
xold = 2*x;
fx = f(x);
dfx = df(x);
i=0;
e_rel = abs(1-xold/x);

fprintf('\nMétodo de Newton:\n');
fprintf('x_%i = %14.6e  f(x_%i) = %14.6e\n',i,x,i,fx);

while(e_rel > epsilon)
  xold = x;
  x=x-fx/dfx;  % passo de Newton
  e_rel = abs(1-xold/x); % erro relativo entre os passos
  fx = f(x);   % atualiza o valor de f no no ponto x
  dfx = df(x); % atualiza o valor da derivada de f no ponto x
  i = i+1;     % atualiza o número de iterações
  fprintf('x_%i = %14.6e  f(x_%i) = %14.6e  e_rel = %14.6e\n',i,x,i,fx,e_rel);
end
