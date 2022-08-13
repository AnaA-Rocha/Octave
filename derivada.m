%AED 3.b)
function dx = derivada(x,y)
  %x e y são vetores com as coordenadas dos pontos
  %dx é o vetor com a derivada em cada pontos
  %primeiro ponto usa diferença progressiva
  %último ponto usa diferença regressiva
  %os demais pontos usa a diferença central
  %objetivo1: usar os pontos fornecidos para calcular a velocidade do bloco em 4 <= t <= 8
  %objetivo2: calcule a aceleração do bloco a partir da diferença da velocidade
  %objetivo3: tracar um grafico contendo deslocamento, velocidade e aceleracao x tempo
  
%objetivo1
  tam = length(x); %n tem o tamanho de x = quantidade de pontos
  %df = (fx(x + h) - fx(x))/( (x + h) - x) - cálculo dif_prog
  dx(1) = (y(2) - y(1))/(x(2) - x(1));
  %df =(fx(x + h) - fx(x - h))/( (x + h) - (x - h)) - cálculo dif_central
  for i = 2:tam-1
    dx(i) = (y(i+1) - y(i-1))/(x(i+1) - x(i-1));
  endfor
  %df = (fx(x) - fx(x - h))/( x - (x - h)) - cálculo dif_reg
  dx(tam) = (y(tam) - y(tam-1)) / (x(tam) - x(tam-1))
  
  
 %Comandos executados na janela de comando:
% t = [4 4.2 4.4 4.6 4.8 5 5.2 5.4 5.6 5.8 6 6.2 6.4 6.6 6.8 7 7.2 7.4 7.6 7.8 8]
% x = [-5.87 -4.23 -2.55 -0.89 0.67 2.09 3.31 4.31 5.06 5.55 5.78 5.77 5.52 5.08 4.46 3.72 2.88 2 1.10 0.23 -0.59]
% vel = derivada(t,x)
% acc = derivada(t,vel)
% plot(t,x)
% plot(t,vel)
% plot(t,acc)
  