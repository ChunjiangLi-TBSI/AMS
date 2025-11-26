n = 50;
m = 200;
L = 10;
g0 = 1;
alpha = 1;
beta = 1;
gamma = g0*sin(((1:n)/L+1/2)*pi).^2;
T = 200;
dt = 0.01;

x0 = zeros(m*n, 1);
p0 = zeros(m*n, 1);

for pos = [-5, -3, 0, 3, 5]
    x0(1:n) = circshift(sech(((1:n) - 25)/5), pos);
    y0 = [x0; p0];

    [t, y] = ode45( ...
        @(t, y)p1DMM_pulse_input(t, y, n, m, alpha, beta, gamma), ...
        0:dt:T, y0);

    snapshot = reshape(y(20000, 1:(m*n)).^2, n, m)';
    save("scan_pos_"+num2str(pos)+".mat", "snapshot");
end
