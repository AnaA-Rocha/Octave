function [A, Det, Pivot] = DecoLU(n, A)
  %Objetivo: Fazer a decomposi��o LU de uma matriz A
  %Par�metros de entrada n {ordem}, A {matriz}
  %Par�metros de sa�da A, Det, Pivot
  %{matriz decomposta A = U + L - I, deeterminante, piv�s}
  for i=1:n
    Pivot(i)=i; %[1 2 3 4]
  endfor
  Det=1;
  for j=1:n-1
    %Escolha do elemento piv�
    p=j;
    Amax=abs(A(j,j));
    for k=j+1:n
      if abs(A(k,j)) > Amax
        Amax = abs(A(k,j));
        p=k;
      endif
    endfor
    if p~=j
      %Troca de linhas
      for k=1:n  
        t=A(j,k);
        A(j,k) = A(p,k);
        A(p,k) = t;
      endfor
      t = Pivot(j);
      Pivot(j) = Pivot(p);
      Pivot(p) = t;
      Det = -Det;
    endif
    Det = Det*A(j,j);
    if abs(A(j,j))~=0
      %Elimina��o de Gauss
      r=1/A(j,j);
      for i=j+1:n
        m=A(i,j)*r;
        A(i,j)=m;
        for k=j+1:n
          A(i,k) = A(i,k) - m*A(j,k);
        endfor
      endfor
    endif
  endfor
  Det = Det*A(n,n);
  disp([Pivot]);
  disp(Det);
  