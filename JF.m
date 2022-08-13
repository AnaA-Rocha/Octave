%matriz jacobiana de funções do exemplo dado
%derivadas parciais
%[f1-x1  f1-x2; f2-x1  f2-x2]
function y=JF(x)
  y(1,1) = 2*x(1)+x(2)*sin(x(1)*x(2))
  y(1,2) = x(1)*sin(x(1)*x(2))
  y(2,1) = 2*sin(x(1))
  y(2,2) = cos(x(2))
endfunction

%f(x,y) = x^5 + 3x^3y^2 + 3xy^4
%d(x) = 5x^4 + 9x^2y^2 + 3y^4
%d(y) = 2x^3y + 12xy^3.
%----------
%f(x,y) = x^2 + y^2 - 2x -6y + 14
%d(x) = 2x - 2
%d(y) = 2y - 6