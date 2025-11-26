m = 100;
L = 50;
dq = 2*pi/L;
lambda = 0.001;

q = 1:3*m;
qx = [pi/L/m*(1:m), pi/L*(1+zeros(1, m)), pi/L:-pi/L/m:pi/L/m];
qy = [zeros(1, m), pi/m*(1:m), pi:-pi/m:pi/m];

bandstructure = zeros(m, 5);
for i = q
    bandstructure(i, :) = eigen_frequency(lambda, qx(i), qy(i), dq, 0);
end

