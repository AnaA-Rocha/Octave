Como resolver interpola��o polinomial no octave
x = [0 1 2 3 ]'
y = [3.95 6.01 5.99 3.96]'
plot(x,y)
A = [ones(4,1) x x.^2 x.^3 y]
rref(A)
Esses comandos resolve aquele primeira caso que utiliza elimina��o de Gauss

%mat�ria
- Interpola��o polinomial: m�todo que diz que qualquer fun��o definida � cont�nua em um intervalo fechado,
    existe um polin�mio t�o pr�ximo da fun��o quanto quisermos;
- Interpola��o linear tem problema com n�meros pr�ximos de 0 (principalmente no piv�);
