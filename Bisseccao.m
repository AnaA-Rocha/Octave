function [x, iter, CondErro] = bissecao(a, b,f,toler, IterMax)
 %Calcular a raiz de uma equa��o pelo m�todo da bissec��o
  %Par�metros de entrada: a, b, f, toler, IterMax
  % limite inferior,limite superior, fun��o, toler�ncia e n�mero m�ximo de itera��es
  %Par�metros de sa�da: raiz, iter, CondErro 
  %raiz, n�mero de itera��es gastas e condi��o de erro (CondErro =0 se a raiz foi encontrada,   CondErro = 1 caso contr�rio)
  % [x, iter, CondErro] = bissecao(-1, 2,'f1',0.0100, 100)
  %  [x, iter, CondErro] = bissecao(0, 2,'f2',0.0100, 100)
  II=[];
  AA = [];
  FA = [];
  BB = [];
  FB = [];
  XX = [];
  FX = [];
  DX = [];
  Fa = feval(f,a); %passa o valor a para a fun��o f
  Fb = feval(f,b); %passa o valor b para a fun��o f
  if Fa * Fb > 0 %resultado tem que ser negativo para ter troca de sinal
     disp ('Funcao nao troca de sinal no intervalo [a,b]')
     return
  end
  DeltaX = abs(b - a) / 2 %usado condi��o de toler�ncia 
  iter = 0;
  itera = 1;
  while itera
    x = (a + b) / 2; %caracteriza o m�todo. Ponto m�dio 
    Fx=feval(f, x); %passa o valor x para a fun��o f
    II =[II;iter]; %itera��o
    AA =[AA; a]; %valor a passado
    FA = [FA; Fa]; %valor de f(a)
    BB = [BB; b]; %valor b passado
    FB =[FB; Fb]; % valor f(b)
    XX = [XX;x] %valor de x passado
    FX = [FX; Fx]; %valor de f(x)
    DX = [DX; DeltaX]; %valor de toler�ncia
    %escreva iter,      a,      Fa,      Fb,     b,     Fb,    x,    Fx, DeltaX
    if (DeltaX <= toler & abs(Fx) <= toler) || (iter >= IterMax) %quando achar a raiz ou ultrapassar os limites, para o while
        itera = 0;
        %Mesma coisa que break;
    end
    if  Fa * Fx > 0 %N�o trocou o sinal
        a = x;
        Fa=Fx;
    else  %Houve troca de sinal
          b = x;
    end
    DeltaX = DeltaX / 2;
    iter = iter + 1;
 end; %while
 raiz = x;
 %teste de converg�ncia
 if (DeltaX <= toler & abs(Fx) <= toler)  
     CondErro = 0;
  else
     CondErro = 1;
 end     
 disp(' iter,      a,          fa,            b,            fb ,           x,             fx,         dx')
 
 R = [II, AA, FA, BB, FB,XX,FX,DX]