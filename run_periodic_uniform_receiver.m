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
    @(t, y)p1DMM_periodic_input(t, y, n, m, alpha, beta, gamma,"uniform"), ...
    0:dt:T, y0);

receiver = y(:, 5001:5050).^2;

save("periodic_uniform_receiver_5.mat", "receiver")
