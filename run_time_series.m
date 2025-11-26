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

y0 = [x0; p0];

[t, y] = ode45( ...
    @(t, y)p1DMM_time_series(t, y, n, m, alpha, beta, gamma, @time_series), ...
    0:dt:T, y0);

x = y(:, 1:m*n);
p = y(:, m*n+1:2*m*n);

t = 20001;
signal = zeros(5, t);


for i = 1:t
    mat = reshape(x(i, :).^2, n, m)';
    signal(1, i) = mat(50,5);
    signal(2, i) = mat(50,15);
    signal(3, i) = mat(50,25);
    signal(4, i) = mat(50,35);
    signal(5, i) = mat(50,45);
end

output = signal;
save("time_series_output.mat","output")