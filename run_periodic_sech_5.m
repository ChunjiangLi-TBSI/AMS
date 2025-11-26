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

x0(1:n) = ones(n, 1);
y0 = [x0; p0];

[t, y] = ode45( ...
    @(t, y)p1DMM_periodic_input(t, y, n, m, alpha, beta, gamma,"sech"), ...
    0:dt:T, y0);

snapshot1 = reshape(y(5000, 1:(m*n)).^2, n, m)';
snapshot2 = reshape(y(10000, 1:(m*n)).^2, n, m)';
snapshot3 = reshape(y(15000, 1:(m*n)).^2, n, m)';

save("periodic_sech_snapshots_5.mat", "snapshot1", "snapshot2", "snapshot3")
