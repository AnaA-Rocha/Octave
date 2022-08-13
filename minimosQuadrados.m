Mínimos quadrados passo a passo
1. Faz o gráfico de dispersão: scatter(x,y)
2. Decide qual caso atende: linear(y=ax+b), quadrático(y=ax^2+bx+c), exponencial(y=ae^(bx))
3. Faz a tabela xi|y1|xi^2|yi*xi com todos os pontos dados
4. Faz o somatório de todas as colunas da tabela
5. Monta a matriz [S{xi} S{xi}; S{xi} n] * [a b] = [S{xi*yi}, S{yi)] %S = somatório
6. Faz a matriz extendida no octave excluindo a e b
7. rref matriz

Exemplo:
x = [1 1.05 1.1 1.15 1.2 1.25 1.3 1.35]
y = [1 1.01 1.02 1.04 1.05 1.06 1.065 1.08]
scatter(x,y)
%Caso linear atende
%cálculo na mão da tabela
%Montar matriz extendida
A = [11.15 9.4 9.806; 9.4 8 8.325]
rref(A)
%Monta o polinomio no arquivo poli e joga um valor de x
