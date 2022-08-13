%NÃO DEU CERTO
function [x] = NewtonSistemas(F,JF,x0,TOL,N)  
  x = x0  
  k = 1  
  #iteracoes  
  while (k <= N)  
    #iteracao de Newton  
    %para rodar: x1 = x0 - inv(JF(x0)) * F(x0)'
    x2 = x - inv(JF(x)) * F(x)
    x = x2;
    %delta = -inv(JF(x))*F(x)  
    %x = x + delta  
    #criterio de parada  
    if (k<TOL)  
      return  
    endif  
    k = k+1  
  endwhile  
endfunction