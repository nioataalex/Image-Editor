function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: calculeaza derivata.
    [m n] = size(f);

    if (x == 0 || x == n)
      r = 0;
      return;
    endif
    
    r = (f(x + 1, y) - f(x - 1, y)) / 2;
    r = double(r);

endfunction