function dy = p1DMM_pulse_input(t, y, n, m, alpha, beta, gamma)
    x = y(1:m*n);
    p = y(m*n+1:2*m*n);
    X = reshape(x, n, m);
    P = reshape(p, n, m);
    dX= P;
    dP = zeros(n, m);
    
    a_v = zeros(1, n);
    a_v(1) = -2;
    a_v(2) = 1;
    a_v(n) = 1;
    AA = toeplitz(a_v);
    
    b_v = zeros(1, m);
    b_v(1) = -2;
    b_v(2) = 1;
    b_v(m) = 1;
    BB = toeplitz(b_v);
    BB(1, 1) = -1;
    BB(1, m) = 0;
    BB(m, 1) = 0;
    BB(m, m) = -1;

    for j = 1:m
        dP(:,j) = dP(:,j) + alpha * AA * X(:,j);
    end

    for i = 1:n
        dP(i,:) = dP(i,:) + beta * X(i,:) * BB  - 2 * gamma(i) * X(i,:);
    end
    
    dx = reshape(dX,m*n,1);
    dp = reshape(dP,m*n,1);

    dy = [dx;dp];

end