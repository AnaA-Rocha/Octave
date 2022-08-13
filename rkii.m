x(1) = 1;
y(1) = 1;
h = 0.2;
i = 1;
n = (y(1)-x(1))/h
y_analit = e^(1.5*1.5 - 1)
for i = 1:5 %quando n = 0, altera aqui na mão
  k1 = h * (sin(x(i)*y(i))); %h*f(xi,yi)
  k2 = h * (sin((x(i)+h)*(y(i)+k1))); %h*f(xi+1,yi+1) ==> h*f[(x(1)+h)*(y(1)+k1)] %valor de x(1) + h
  y(i+1) = y(i) + 0.5 * (k1 + k2); %Yn + (k1+k2)/2
  x(i+1) = x(i) + h;
  disp([x(i+1) y(i+1)])
endfor

erel = 100 * abs(y(i) - y_analit) / abs(y_analit)

 % Fórmula iterativa: Y(n+1) = Yn + (k1+k2)/2 | k1=h*f(xn,yn) | k2=h*f(xn+1,yn+1)
 % num iteracoes: h = (b-a)/n
 % coloca no for o num de iteracoes
 % Lembra de isolar a derivada
 %Exercicio:
 % y' = 2xy
 % y(1) = 1
 % quer encontrar y(1.5)
 % x0 = 0 | y0 = 1| h = 0.1
 % Calcula k1 e k2 utilizando a função
 
 % y_analit é a solução da EDO