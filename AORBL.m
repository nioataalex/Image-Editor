function [A, B, C] = AORBL(A, B, C, s1, s2, tol, H)
    [n p] = size(A);
    H = eye(p);
    eps = 1;
    m = 1;
    while (eps > tol)
        [V(m), W(m)] = Rational_Block_Lanczos(A, B ,C);
        A(m) = W(m)' * A * V(m);
        B(m) = W(m)' * B;
        C(m) = C * V(m);
        
        eps = norm(H(m) - H(m-1), inf);
        m = m + 1;
    endwhile

endfunction