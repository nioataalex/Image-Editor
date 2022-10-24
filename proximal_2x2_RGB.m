function [out] = proximal_2x2_RGB(img, STEP = 0.1)
% ==============================================================================================
% Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
% img este o imagine colorata RGB -Red, Green, Blue.
% =============================================================================================

    % TODO: extrage canalul rosu al imaginii.
    R = img(:,:,1);
    % TODO: extrage canalul verde al imaginii.
    G = img(:,:,2);
    % TODO: extrace canalul albastru al imaginii.
    B = img(:,:,3);

    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    red = proximal_2x2(R, STEP);
    green = proximal_2x2(G, STEP);
    blue = proximal_2x2(B, STEP);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red, green, blue);
    
endfunction