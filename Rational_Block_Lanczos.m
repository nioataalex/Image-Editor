function [V W] = Rational_Block_Lanczos(A, B, C, sigma)
    [n n1] = size(A);
    m = length(sigma);
    I = eye(A);
    S(0) = inv(A - sigma(1) * I) * B;
    R(0) = inv((A - sigma(1) * I)') * C';

    V_v(1) = [V];
    W_v(1) = [W];

    for k = 1 : m
        if(k < m)
            if(sigma(k + 1) == inf)
                S(k) = A * V(k);
                R(k) = A' * W(k);
            else 
                S(k) = inv(A - sigma(k + 1) * I) * V(k);
                R(k) = inv((A - sigma(k + 1) * I)') * W(k);
            endif 
            H(k) = W_v(k)' * S(k);
            G(k) = V_v(k)' * R(k);
            S(k) = S(k) - V_v(k) * H(k);
            R(k) = R(k) - W_v(k) * G(k);
            S(k) = V(k + 1) * H(k + 1, k);
            R(k) = W(k + 1) * G(k+1, k);
            W(k + 1)' * V(k + 1) = P(k) * D(k) * Q(k)';
            V(k + 1) = V(k + 1) * Q(k) * inv(sqrt(D));
            W(k + 1) = V(k + 1) * P(k) * inv(sqrt(D));
            H(k + 1,  k) = sqrt(D(k)) * Q(K)' * H(k + 1, k);
            G(k + 1, k) = sqrt(D(k)) * P(K)' * G(k + 1, k);

            V_v(k + 1) = [V_v(k), V(k + 1)];
            W_v(k + 1) = [W_v(k), W(k + 1)];
        else
            if(sigma(m + 1) == inf)
                S(m) = A * B;
                R(m) = A' * C;
            else 
                S(m) = inv(A) * B;
                R(m) = inv(A') * C';
            endif
            H(m) = W_v(m)' * S(m);
            G(m) = V_v(m)' * R(m);
            S(m) = S(m) - V_v(m) * H(m);
            R(m) = R(m) - W_v(m) * G(m);
            S(m) = V(m + 1) * H(m + 1, m);
            R(m) = W(m + 1) * G(m + 1, m);
            W(m + 1)' * V(m + 1) = P(m) * D(m) * Q(m)';
            V(m + 1) = V(m + 1) * Q(m) * inv(sqrt(D(m)));
            W(m + 1) = W(m + 1) * P(m) * inv(sqrt(D(m)));
            H(m + 1, m) = sqrt(D(m)) * Q(m)' * H(m + 1, m);
            G(m + 1, m) = sqrt(D(m)) * P(m)' * G(m + 1, m);
            V_v(m + 1) = [V_v(m), V(m +1)];
            W_v(m + 1) = [W_v(m), W(m +1)];
    endfor
endfunction