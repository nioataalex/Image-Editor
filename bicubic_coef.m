function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
% =========================================================================
% Calculeaza coeficientii de Interpolare Bicubica pentru 4 puncte alaturate
% =========================================================================

    % TODO: Calculeaza matricile intermediare.
    % TODO: Converteste matricile intermediare la double.
    X = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    X1 = X';

    f00 = double(f(y1, x1));
    f01 = double(f(y2, x1));
    f02 = double(Iy(y1, x1));
    f03 = double(Iy(y2, x1));

    f10 = double(f(y1, x2));
    f11 = double(f(y2, x2));
    f12 = double(Iy(y1, x2));
    f13 = double(Iy(y2, x2));

    f20 = double(Ix(y1, x1));
    f21 = double(Ix(y2, x1));
    f22 = double(Ixy(y1, x1));
    f23 = double(Ixy(y2, x1));

    f30 = double(Ix(y1, x2));
    f31 = double(Ix(y2, x2));
    f32 = double(Ixy(y1, x2));
    f33 = double(Ixy(y2, x2));

    % TODO: Calculeaza matricea finala.
    M = [f00,f01 ,f02 ,f03; f10,f11 ,f12 ,f13; f20,f21,f22,f23; f30, f31, f32,f33];
    A = X * M * X1;
   
endfunction