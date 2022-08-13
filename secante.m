function [Raiz,Iter,Erro] = Secante(a,b,funcao,Toler,IterMax);


%parametros de entrada: funcao,a,b,Toler,IterMax,Exibe -> funcao, lim. intervalo,

%tolerancia e num. max de iteracoes, resultados intermediarios devem ser

%exibidos??

%parametros de saida: Raiz,Iter,Erro -> raiz, numero gasto de iteracoes e

%condicao de erro



x = a;

Fa = eval(funcao);

x = b;

Fb = eval(funcao);



%visualizacao da funcao

Ft =[];

lim =15;

for x=-lim/3:0.1:lim

    Ft =[Ft;eval(funcao)];

end

x = -lim/3:0.1:lim;

figure(1);

plot(x,Ft,'b');

hold on;

plot(x,zeros(size(x,2)),'k');

grid;

plot([a b],[Fa Fb],'k*');

xlabel('Eixo x');

ylabel('Eixo y');

title(funcao);

pause;





if abs(Fa) < abs(Fb)

    t = a;

    a = b;

    b = t;

    t = Fa;

    Fa = Fb;

    Fb = t;

end





    disp('Calculo de raiz de equacao pelo metodo da secante')

    disp('iter    a     b    x     Fx    deltaX')





Iter = 0;

x = b;

Fx = Fb;

while 1    

    DeltaX = -Fx/(Fb-Fa)*(b-a);

    x = x+DeltaX;

    Fx = eval(funcao);

    

    hold on;

    plot(x,Fx,'r*');

    drawnow;

    pause;

    

    disp ([Iter a b x Fx DeltaX]);

    if(abs(DeltaX)<Toler && abs(Fx)<Toler)||Iter >=IterMax

        break;

    end

    a = b;

    Fa = Fb;

    b = x;

    Fb = Fx;

    Iter = Iter+1;

end

Raiz = x;

if abs(DeltaX)<Toler && abs(Fx)<Toler

    Erro = 0;

else

    Erro = 1;

end



end