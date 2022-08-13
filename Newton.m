%? Não usa o limite superior na função
function [x, iter, CondErro] = Newton(x0, d, f, toler, IterMax)
%Algoritmo newtonraphson 
% TEM COMO OBJETIVO ESTIMAR AS RAÍZES DE UMA FUNÇÃO. PEGA UM PONTO QUALQUER DA FUNÇÃO, CALCULA A FUNÇÃO TANGENTE 
% (DERIVADA NO PONTO), CALCULA ONDE A TANGENTE INTERCEPTA O EIXO X, CALCULA O VALOR DA FUNÇAO NESSE PONTO,
% E REPETE O PROCESSO
%Calcular a raiz de uma equação pelo método da secante 
%Parâmetros de entrada: x0, d, f, toler, IterMax 
%valor inicial, limite superior, função, tolerância e número máximo de iterações 
%Parâmetros de saída: raiz, iter, CondErro  
%raiz, número de iterações gastas e condição de erro (CondErro =0 se a raiz foi encontrada,   CondErro = 1 caso contrário)

%DECLARANDO OS VETORES
  Fx = [];
  %DFx = [];
  toler = 100;
  iteMax = 100;

  x = x0
  Fx = feval(f,x) %PASSANDO X0 PARA A FUNÇÃO F
  %diff Difference and approximate derivative
  DFx = eval(diff(sym(f))) %d(fx0)
 
  iter = 0
  bool = 0;
  %escreva iter, x DFx, Fx
  disp('      Iteração        x     DFx      Fx        ');
  disp([iter           x        DFx      Fx     ]);

  %repita
  %NÃO TEM CONDIÇÃO DE PARADA AQUI, ACHO QUE VAI PARAR SOMENTE NO BREAK DENTRO DO IF
  while(bool == 0) %ENQUANTO VERDADEIRO    
    DeltaX = -Fx / DFx    
    x = x + DeltaX    
    Fx = feval('f',x)    
    DFx = eval(diff(sym('f')))
    iter = iter + 1    
    %escreva iter, x, DFx, Fx, DeltaX
    disp('      Iteração        x     DFx      Fx        DeltaX');
    disp([iter           x        DFx      Fx     DeltaX]); 
    %? AQUI O DFX == 0?
    %Valor absoulo de deltax e de Fx <= que a toleância. Número de iteração >= que a iteração máxima. Derivada de Fx == 0 
    if ((abs(DeltaX) <= toler && abs(Fx) <= toler) || (DFx == 0) || Iter >= IterMax ) 
      bool = 1;   
    endif 
  endwhile 
     
  raiz = x
  %teste de convergência 
  %Valor absoulo de deltax e de Fx <= que a toleância
  if abs(DeltaX) <= toler && abs(Fx) <= toler     
    CondErro = 0;
  else  
    CondErro = 1 
  endif
 %fim algoritmo
 end