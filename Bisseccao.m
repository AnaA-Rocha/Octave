function [x, iter, CondErro] = bissecao(a, b,f,toler, IterMax)
 %Calcular a raiz de uma equação pelo método da bissecção
  %Parâmetros de entrada: a, b, f, toler, IterMax
  % limite inferior,limite superior, função, tolerância e número máximo de iterações
  %Parâmetros de saída: raiz, iter, CondErro 
  %raiz, número de iterações gastas e condição de erro (CondErro =0 se a raiz foi encontrada,   CondErro = 1 caso contrário)
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
  Fa = feval(f,a); %passa o valor a para a função f
  Fb = feval(f,b); %passa o valor b para a função f
  if Fa * Fb > 0 %resultado tem que ser negativo para ter troca de sinal
     disp ('Funcao nao troca de sinal no intervalo [a,b]')
     return
  end
  DeltaX = abs(b - a) / 2 %usado condição de tolerância 
  iter = 0;
  itera = 1;
  while itera
    x = (a + b) / 2; %caracteriza o método. Ponto médio 
    Fx=feval(f, x); %passa o valor x para a função f
    II =[II;iter]; %iteração
    AA =[AA; a]; %valor a passado
    FA = [FA; Fa]; %valor de f(a)
    BB = [BB; b]; %valor b passado
    FB =[FB; Fb]; % valor f(b)
    XX = [XX;x] %valor de x passado
    FX = [FX; Fx]; %valor de f(x)
    DX = [DX; DeltaX]; %valor de tolerância
    %escreva iter,      a,      Fa,      Fb,     b,     Fb,    x,    Fx, DeltaX
    if (DeltaX <= toler & abs(Fx) <= toler) || (iter >= IterMax) %quando achar a raiz ou ultrapassar os limites, para o while
        itera = 0;
        %Mesma coisa que break;
    end
    if  Fa * Fx > 0 %Não trocou o sinal
        a = x;
        Fa=Fx;
    else  %Houve troca de sinal
          b = x;
    end
    DeltaX = DeltaX / 2;
    iter = iter + 1;
 end; %while
 raiz = x;
 %teste de convergência
 if (DeltaX <= toler & abs(Fx) <= toler)  
     CondErro = 0;
  else
     CondErro = 1;
 end     
 disp(' iter,      a,          fa,            b,            fb ,           x,             fx,         dx')
 
 R = [II, AA, FA, BB, FB,XX,FX,DX]