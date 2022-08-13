%? N�o usa o limite superior na fun��o
function [x, iter, CondErro] = Newton(x0, d, f, toler, IterMax)
%Algoritmo newtonraphson 
% TEM COMO OBJETIVO ESTIMAR AS RA�ZES DE UMA FUN��O. PEGA UM PONTO QUALQUER DA FUN��O, CALCULA A FUN��O TANGENTE 
% (DERIVADA NO PONTO), CALCULA ONDE A TANGENTE INTERCEPTA O EIXO X, CALCULA O VALOR DA FUN�AO NESSE PONTO,
% E REPETE O PROCESSO
%Calcular a raiz de uma equa��o pelo m�todo da secante 
%Par�metros de entrada: x0, d, f, toler, IterMax 
%valor inicial, limite superior, fun��o, toler�ncia e n�mero m�ximo de itera��es 
%Par�metros de sa�da: raiz, iter, CondErro  
%raiz, n�mero de itera��es gastas e condi��o de erro (CondErro =0 se a raiz foi encontrada,   CondErro = 1 caso contr�rio)

%DECLARANDO OS VETORES
  Fx = [];
  %DFx = [];
  toler = 100;
  iteMax = 100;

  x = x0
  Fx = feval(f,x) %PASSANDO X0 PARA A FUN��O F
  %diff Difference and approximate derivative
  DFx = eval(diff(sym(f))) %d(fx0)
 
  iter = 0
  bool = 0;
  %escreva iter, x DFx, Fx
  disp('      Itera��o        x     DFx      Fx        ');
  disp([iter           x        DFx      Fx     ]);

  %repita
  %N�O TEM CONDI��O DE PARADA AQUI, ACHO QUE VAI PARAR SOMENTE NO BREAK DENTRO DO IF
  while(bool == 0) %ENQUANTO VERDADEIRO    
    DeltaX = -Fx / DFx    
    x = x + DeltaX    
    Fx = feval('f',x)    
    DFx = eval(diff(sym('f')))
    iter = iter + 1    
    %escreva iter, x, DFx, Fx, DeltaX
    disp('      Itera��o        x     DFx      Fx        DeltaX');
    disp([iter           x        DFx      Fx     DeltaX]); 
    %? AQUI O DFX == 0?
    %Valor absoulo de deltax e de Fx <= que a tole�ncia. N�mero de itera��o >= que a itera��o m�xima. Derivada de Fx == 0 
    if ((abs(DeltaX) <= toler && abs(Fx) <= toler) || (DFx == 0) || Iter >= IterMax ) 
      bool = 1;   
    endif 
  endwhile 
     
  raiz = x
  %teste de converg�ncia 
  %Valor absoulo de deltax e de Fx <= que a tole�ncia
  if abs(DeltaX) <= toler && abs(Fx) <= toler     
    CondErro = 0;
  else  
    CondErro = 1 
  endif
 %fim algoritmo
 end