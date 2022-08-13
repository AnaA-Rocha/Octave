%definir a aproimacao inicial
%x = [1 1]' (vetor coluna) entao executa: x1 = x - inv(JF(x))*F(x) e x2 = x1 - inv(JF(x1))*F(x1)
%executar
%para rodar: x1 = x0 - inv(JF(x0)) * F(x0)'
function y=F(x)
  %y(1) = x(1)^2-cos(x(1)*x(2))-1
  %y(2) = sin(x(2))-2*cos(x(1))
  y = [x(1)^2-cos(x(1)*x(2))-1; sin(x(2))-2*cos(x(1))]
endfunction
%foi dado o sistema:
% x1^2 - cos(x1x2) = 1
% sen(x2)-2cos(x1))