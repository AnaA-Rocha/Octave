y(1) = 1; %condicao inicial
x(1) = 1; %valor incial
h = 0.1;
y_analit = 3.409342957;
i = 1;
while x(i) <= 1.5 %x que quer achar
  ya(i+1) = y(i) + h*(2*x(i) * y(i)); %y(i) + h*(função)
  x(i+1) = x(i) + h;
  y(i+1) = y(i) + 0.5 * h * ((2 * x(i) * y(i)) + 2 * x(i+1) * ya(i+1)); %y(i) + 0.5 * h * função + função [com ya]
  i = i + 1;
  disp([x(i) y(i)])
endwhile

erel = 100 * abs(y(i) - y_analit) / abs(y_analit)

 % Fórmula iterativa: Y(n+1) = Yn + (h/2)*f(xn,yn) + f(x(i+1),y_chapeu(i+1))
 % coloca no while o x que quer encontrar
 % Lembra de isolar a derivada
 %Exercicio:
 % y' = 2xy
 % y(1) = 1
 % quer encontrar y(1.5)
 % x0 = 0 | y0 = 1| h = 0.1
 % ya(i+1) = y(i) + h*(função);
 % y(i+1) = y(i) + 0.5 * h * (função + função [com ya]);
 
 % y_analit é a solução da EDO