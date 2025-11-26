n = 50;
m = 200;
L = 10;
g0 = 1;
alpha = 1;
beta = 1;
gamma = g0*sin(((1:n)/L+1/2)*pi).^2;
T = 240;
dt = 0.01;

x0 = zeros(m*n, 1);
p0 = zeros(m*n, 1);

y0 = [x0; p0];

[t, y] = ode45( ...
    @(t, y)p1DMM_time_series(t, y, n, m, alpha, beta, gamma, @time_series), ...
    0:dt:T, y0);
%% 

snapshot = reshape(y(24000, 1:(m*n)).^2, n, m);
map = TheBestColor('akun',67, 'map', 256);
imagesc(snapshot/max(snapshot,[],"all"))
shading interp
colormap(map)
ax = gca;
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLabel.Rotation = 0;
ax.YLabel.Rotation = 0;

