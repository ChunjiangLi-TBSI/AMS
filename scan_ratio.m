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

ratio = zeros(5, 50);

for pos = -24:25
    x0(1:n) = circshift(sech(((1:n) - 25)/5), pos);
    y0 = [x0; p0];

    [t, y] = ode45( ...
        @(t, y)p1DMM_pulse_input(t, y, n, m, alpha, beta, gamma), ...
        0:dt:T, y0);

    snapshot = reshape(y(20000, 1:(m*n)).^2, n, m)';
    save("./scan_pos/scan_pos_"+num2str(pos)+".mat", "snapshot");

    ratio(1, pos+25) = sum(snapshot(130:150, 4:6), "all")/sum(snapshot(130:150, :), "all");
    ratio(2, pos+25) = sum(snapshot(130:150, 14:16), "all")/sum(snapshot(130:150, :), "all");
    ratio(3, pos+25) = sum(snapshot(130:150, 24:26), "all")/sum(snapshot(130:150, :), "all");
    ratio(4, pos+25) = sum(snapshot(130:150, 34:36), "all")/sum(snapshot(130:150, :), "all");
    ratio(5, pos+25) = sum(snapshot(130:150, 44:46), "all")/sum(snapshot(130:150, :), "all");
end

save("ratio.mat", "ratio");