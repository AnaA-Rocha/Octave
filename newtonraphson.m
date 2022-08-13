%Algoritmo newtonraphson 
%Calcular a raiz de uma equa��o pelo m�todo da secante 
%Par�metros de entrada: x0, f, d, toler, IterMax 
%valor inicial, limite superior, fun��o, toler�ncia e n�mero m�ximo de itera��es 
%Par�metros de sa�da: raiz, iter, CondErro  
%raiz, n�mero de itera��es gastas e condi��o de erro 
%(CondErro =0 se a raiz foi encontrada,   CondErro = 1 caso contr�rio)
%Para rodar: [x, Iter, CondErro] = newtonraphson(2, 0, 0, 1e-12, 20) //as funcoes pega aqui dentro do m�todo
function [x, Iter, CondErro] = newtonraphson(x0, f, d, toler, IterMax)
%x0: valor inicial || d: derivada || f: fun��o || toler: tolerancia || IterMax :iteracao max
  Fx = fNewton(x0);
  DFx = dNewton(x0);
  x = x0;
  Iter = 0;
  itera = 1;
  %disp([Iter, x, DFx, Fx])
  while itera
    DeltaX = -Fx/DFx;
    x = x + DeltaX;
    %disp([Iter, x, DFx, Fx, DeltaX])
    disp([Iter, x])
    Fx = fNewton(x);
    DFx = dNewton(x);
    Iter = Iter + 1;
    %disp([toler, DeltaX, Fx, DFx, IterMax, Iter])
    if (abs(DeltaX) <= toler && abs(Fx) <= toler) || Iter >= IterMax
      itera = 0;
    endif
  endwhile
  raiz = x;
  %teste de convergencia
  disp([DeltaX, Fx, toler])
  if abs(DeltaX) <= toler && abs(Fx) <= toler
    CondErro = 0;
  else
    CondErro = 1;
  endif
  
 %Iteracao de Newton := x{k+1} = x{k} - (f(x{k}))/(f'(x{k}))
 %Se a derivada for nula em algum ponto, d� merda (ou quase nula)
