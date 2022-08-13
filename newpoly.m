%Diferença divididas de Newton
function [C,D] = newpoly(X,Y)
  %Parâmetros de entrada: X - vetor de abscissas Y – vetor de ordenadas
  %Parâmetros de saída:  C - vetor de coeficientes D – diferenças divididas
  %Coeficientes da diagonal principal: 1, 3 e 1
  n = length(X);
  D = zeros(n,n);
  D(:,1) = Y';
  for j=2:n
    for k=j:n
      D(k,j) = (D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
    endfor
  endfor
  %Determina os coeficientes de Newton
  C = D(n,n);
  for k=(n-1):-1:1
    C = conv(C,poly(X(k)));
    m = length(C);
    C(m) = C(m) + D(k,k);
  endfor
%como rodar:
%x = [-1 0 1]'
%y = [-1 1 0.5]
%newpoly(x,y)
%a resposta é do maior x^n para o menor
%atualiza os coeficientes no arquivo poli
%testa com ponto conhecido: poli(2)

%teoria
%É utilizado sempre que tem pares ordenados da função. Não se sabe a lei de formação da função apenas alguns pontos dela
%pn(x) = d0 + d1(x-x0) + d2(x-x0)(x-x1) + ... + dn(x-x0)(x-x1)...(x-xn-1) 
%di é os operados de diferença dividida, é ele que o código retorna
%d0 = f(x0)
%monta a tabela: x|f(x)|ordem1|ordem2|ordem n-1     --> os elementos da diagonal é os ds
%Para esoclher a orde, quando todos os itens da coluna forem praticamentes constantes = pega essa coluna
%  qunado todos os itens da coluna forem praticamente 0 ou 0 = pega a coluna anterior
%f[x1,x2,x3] = F3,2 --> 3 = quantos x e 2 = ordem do polinomio