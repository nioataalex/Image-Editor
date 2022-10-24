function out = bicubic_resize_RGB(img, p, q)
% =========================================================================
% Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
% Imaginea img este colorata.
% =========================================================================

    % TODO: extrage canalul rosu al imaginii.
    R = img(:,:,1);
    % TODO: extrage canalul verde al imaginii.
    G = img(:,:,2);
    % TODO: extrace canalul albastru al imaginii.
    B = img(:,:,3);

    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    red = bicubic_resize(R, p, q);
    green = bicubic_resize(G, p, q);
    blue = bicubic_resize(B, p, q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori.
    out = cat(3, red, green, blue);
endfunction