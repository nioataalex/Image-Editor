function out = nonsym_Lanczos(A, V, W, m)
    [Q, R] = qr(W' * V);
    V1(1) = V * inv(R);
    W1(1) = W * Q;
    V2(2) = A * V(1);
    W2(2) = A' * W(1);
    for j = 1 : m
        alpha = W(j)' * Vu(j + 1);
        V2(j + 1) = V2(j + 1) - V1(j) * alpha;
        W2(j + 1) = W2(j + 1) - W1(j) * alpha';
        
        beta  = V2(j + 1) / V1(j + 1);
        delta = W2(j + 1) / W1(j + 1);
        delta = delta';
        
        [X, Y, Z] = svd(W(j + 1)' * V(j + 1));
        delta = delta * X * sqrt(Y);
        beta = sqrt(S) * Z * beta;
        V1(j + 1) = V1(j + 1) * Z' * (1/sqrt(Y));
        W1(j + 1) = W1(j + 1) * X * (1/sqrt(Y));
        V2(j + 2) = A * V1(j + 1) - V1(j) * beta;
        W2(j + 2) = A' * W1(j + 1) - W1(j) * beta'; 
    endfor
endfunction