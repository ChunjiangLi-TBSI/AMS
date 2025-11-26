n = 50;
m = 200;
L = 50;
g0 = 0;
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
    @(t, y)p1DMM_pulse_input(t, y, n, m, alpha, beta, gamma), ...
    0:dt:T, y0);

x_trivial = y(:, 1:m*n);
p_trivial = y(:, m*n+1:2*m*n);

t = 20000;
loc_trivial = zeros(1, t);
entro_trivial = zeros(1, t);
%% 

for i = 1:t
    l = round(0.01*i);
    mat = reshape(x_trivial(i, :).^2, n, m)';
    s = sum(mat(max(1, l-5):min(200, l+5), :), 1);
    loc_trivial(i) = sum(s.^2)/sum(s).^2;
    mat = reshape(x_trivial(i, :).^2, n, m)';
    mi = max(mat(max(1, l-5):min(200, l+5), :), [], 1);
    fi = mi/sum(mi);
    entro_trivial(i) = sum(-fi.*log(fi), "all");
end

save("trivial_loc_entro.mat", "entro_trivial","loc_trivial")
