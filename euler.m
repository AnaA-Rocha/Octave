v(1) = 1; %y0
t(1) = 0; %x0
h = 0.01;
n = (v(1) - t(1))/h + 1 %num de iteracoes
v_analit = 2.613420996 %dado pelo professor ou calcula
for i = 1:n
  v(i + 1) = v(i) + h * (10 * t(i) - 2.5 * v(i)); %Yn + h*f(xn,yn)
  t(i + 1) = t(i) + h;
  disp([t(i) v(i)])
 endfor
 
 erel = abs(v(i) - v_analit) / abs(v_analit) * 100
 
 % Fórmula iterativa: Y(n+1) = Yn + h*f(xn,yn)
 % Para saber a quantidade de iteracoes: h = (b - a) / n onde b é o limite superior
 % Coloca a quantidade de iteracoes no for
 % Lembra de isolar a derivada
 %Exercicio:
 % v' = 10t - 2.5v
 % v(0) = 1
 % Quer encontrar v(1)
 % x0 = 0 = t | y0 = 1 = v| h = 0.01
 % Passo: v(i+1) = v(i) + h*(função com os valores de x0 e y0)
 % Passo: v(i+1) = v(i) + h*(10*t(i) - 2.5*v(i))
 
 % y_analit é a solução da EDO
 
 %Como usar:
 %euler