function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: calculeaza derivata
    [m n] = size(f);

    if (x == 0 || x == n)
      r = 0;
      return;
    endif

    r = (f(x, y + 1) - f(x, y - 1)) / 2;
    r = double(r);

endfunction