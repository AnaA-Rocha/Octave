%Aloritmo prof
function [x, Iter, CondErro] = jacobiProf(n, A, b, toler, IterMax)
  %Tem que olhar se a matriz � diagonalmente dominante por linhas (garantia convergir) TROCAR LINHAS
  %Se norm(A) = 0 achou a solu��o
  %Objetivos: resolver o sistema Ax = b pelo método de Jacobi
  %Parâmetros de entrada: n(ordem/dimensão da matriz), a(matriz), b(vetor independente), toler (tolerancia de erro, 5 casas decimais), iteMax  
  %vetor b � de resposta das fun��es
  %Parâmetros de saída: vetor solução, núm de iterações, Conderro
  %[x, iter, CondErro] = jacobiProf(3, [10 3 -2;2 8 -1;1 1 5], [57;20;-4], 1.0000e-05, 9)
  %rref(matriz A) = resposta exata
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
    %iteracoes do jacobi
    Iter = Iter + 1;
    for i=1:n
        Soma = 0;
        for j=1:n
          if i~=j
            Soma = Soma + A(i,j)*x(j);
          endif
        endfor
        v(i) = b(i)- Soma;
    endfor
    NormaNum = 0;
    NormaDen = 0;
    for i=1:n
        t = abs(v(i)) - x(i);
        if t > NormaNum
          NormaNum = t;  
        endif
        if abs(v(i)) > NormaDen
          NormaDen = abs(v(i));
        endif
        x(i) = v(i);
    endfor
    NormaRel = NormaNum/NormaDen;
    %disp([Iter, x, NormaRel]);
      %Teste covnergencia
     %disp([NormaRel, toler])
    if (NormaRel <= toler) || (Iter >= IterMax)
       Itera = 0;
    endif
    endwhile
    if NormaRel <= toler
      CondErro = 0;
    else
      CondErro = 1;
    endif
    
 %Teormea de bolzano: troca de sinal
 %A = L + D + U ==> Ax*=b ==> (L + D + U)x*=b ==> Dx* = -(L +U)x* + b ==> x* = -D^-1(L + U)x* + D^-1b ~= fi(x*)
 %Fun��o de iteracao: B^j = -D^-1(L+U), c=D^-1b
 %Olha a norma infinita para saber se converge: norm(A,inf) --> tem q ser pr�x. de 0
    

