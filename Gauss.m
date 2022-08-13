%Método de Gauss - Seidel
% Ax = y
% A diferença do Jacobi é que no de Gauss usa os valores calculados na iteração anterior para calcular a próxima iteração
% O método de Jacobi usa sempre o valor inicial
% tem que olhar se � diagonalmente dominante por linhas
function [x, Iter, CondErro] = Gauss(n, A, b, toler, IterMax)
  %Parâmetros de entrada: n(ordem/dimensão da matriz), a(matriz), b(vetor independente), toler (tolerancia de erro, 5 casas decimais), iteMax  
  %Parâmetros de saída: vetor solução, núm de iterações, Conderro
  %[x, iter, CondErro] = Gauss(3, [10 3 -2;2 8 -1;1 1 5], [57;20;-4], 1.0000e-05, 9)
  %[x, iter, CondErro] = Gauss(3, [3 0.25 -0.5;0 -2 1;2 0 -2], [3;-6;-2], 1.0000e-03, 3)
  % A = [3 0.25 -0.5 3;0 -2 1 -6;2 0 -2 -2] -> rref(A) --> er = abs(1 - 1.0081)/abs(1) ==> (x* - x)/x*
  % Linha acima calcula o erro relativo
  % Erro absoluto: |x - x*| onde x* � exato(rref)
  %|aii| > (somat�rio de j at� n e i diferente) j |aij|, para todo i
  for i=1:n 
    r=1/A(i,i);
    for j=1:n
      if i~=j
        A(i,j) = A(i,j)*r;
      endif
    endfor
      b(i) = b(i)*r;
      x(i) = b(i);
  endfor
  Iter = 0;
  Itera = 1; %variável de controle do repita
  while Itera
    Iter = Iter + 1;
    for i=1:n
        Soma = 0;
        for j=1:n
          if i~=j
            Soma = Soma + A(i,j)*x(j);
          endif
        endfor
        v(i) = x(i);
        x(i) = b(i)- Soma;
    endfor
    NormaNum = 0;
    NormaDen = 0;
    for i=1:n
        t = abs(x(i) - v(i));
        if t > NormaNum
          NormaNum = t;  
        endif
        if abs(x(i)) > NormaDen
          NormaDen = abs(x(i));
        endif
    endfor
    NormaRel = NormaNum/NormaDen;
    disp([Iter, x, NormaRel]);
      %Teste covnergencia
    if (NormaRel <= toler) || (Iter >= IterMax)
       Itera = 0;
    endif
    endwhile
    if NormaRel <= toler
      CondErro = 0;
    else
      CondErro = 1;
    endif
  %U � diagonal superior
 %A = L + D + U ==> Ax*=b ==> (L + D + U)x*=b ==> (L+D)x* = -Ux* + b ==> x* = -(L+D)^-1Ux* + (L+D)^-1b ~= fi(x*)   
 %Fun��o de iteracao: B^g = -(L+D)^-1U, c=(L+D)^-1b 
  %Olha a norma infinita para saber se converge: norm(A,inf) --> tem q ser pr�x. de 0