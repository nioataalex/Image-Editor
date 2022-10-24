function [Ix, Iy, Ixy] = precalc_d(I)
% =========================================================================
% Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
% imaginii I pentru fiecare pixel al acesteia.
% =========================================================================

    % Obtinem dimensiunea imaginii.
    [m n colors] = size(I);

    % TODO: Tranforma matricea I in double.
    I = cast(I, "double");
    
    Ix = zeros(m,n);
    Iy = zeros(m,n);
    Ixy = zeros(m,n);

    % TODO: Calculeaza matricea cu derivate fata de x Ix.
    for i = 2 : n - 1
      for j = 1 : m
        if((i == 1) || (i == n))
          Ix(j,i) = 0;
        else 
          Ix(j, i) = fx(I, j, i);
        endif
      endfor
    endfor
    
    % TODO: Calculeaza matricea cu derivate fata de y Iy.
    for i = 1 : n
      for j = 2 : m - 1
        if((j == 1) || (j == m))
            Iy(j , i) = 0;
        else
            Iy(j, i) = fy(I, j, i);
        endif
      endfor
    endfor

    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.  
    for i = 2 : n - 1
      for j = 2 : m - 1
        if((j == 1) || (i == 1) || (i == n) || (j == m) )
          Ixy(j,i) = 0;
        else
          Ixy(j, i) = fxy(I, j, i);
        endif
      endfor
    endfor
    
endfunction