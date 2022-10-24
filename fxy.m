function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: calculeaza derivata
    [m n] = size(f);

    if (x == 0 || x == n)
      r = 0;
      return;
    endif

    r = (f(x+1, y+1) + f(x-1, y-1) - f(x-1,y+1) - f(x+1, y-1))/4;
    r = double(r);
endfunction