function [C,L]=lagran(X,Y)
  %Parametros de entrada: X - vetor de abscissas(x). Y - vetor de ordenadas
  %Parametros de saida: C - vetor com coeficientes do polinomio de lagrange
                      % L - matriz com os coeficientes do polinomio de lagrange
  w = length(X);
  n = w - 1;
  L = zeros(w,w);
  %Forma os coeficientes dos polinomios
  for k=1:n+1
    V = 1;
    for j=1:n+1
      if k~=j
        V = conv(V, poly(X(j)))/(X(k)-X(j)); %conv multiplica 2 vetores polinomio
      endif
    endfor
    L(k,:) = V;
  endfor
  %Determine os coeficientes de Lagrange
  C = Y * L;
%como rodar:
%x = [2 3 5]
%y = [0.64 0.24 2.94]
%lagran(x,y)
%atualiza os coeficientes no arquivo poli
%testa com ponto conhecido: poli(2)

%Matéria
%pn(x) = y0L0(x) + y1L1(x) + ... + ynLn(x) onde yi = f(xi)
%Lk(x) = {(x-x[0])(x-x[1])...(x-x[k-1])(x-x[k+1])...(x-x[n])} / {(x[k]-x0)(k[k]-x[1])...(x[k]-x[k-1])(x[k]-x[k+1])...(xk-xn)}
%Problema: dá muito trabalho de calcular quando o grau do polinômio é muito grande
%L0 = (x-x1)(x-x2)/(x0-x1)(x0-x2)
%MANDA COM OS PONTOS QUE TE INTERESSA, SE NÃO DÁ MERDA