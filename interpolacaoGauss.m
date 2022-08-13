Como resolver interpolação polinomial no octave
x = [0 1 2 3 ]'
y = [3.95 6.01 5.99 3.96]'
plot(x,y)
A = [ones(4,1) x x.^2 x.^3 y]
rref(A)
Esses comandos resolve aquele primeira caso que utiliza eliminação de Gauss

%matéria
- Interpolação polinomial: método que diz que qualquer função definida é contínua em um intervalo fechado,
    existe um polinômio tão próximo da função quanto quisermos;
- Interpolação linear tem problema com números próximos de 0 (principalmente no pivô);
