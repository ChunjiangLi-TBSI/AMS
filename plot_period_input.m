t = 0.01:0.01:200;
X0 = sech(((1:n) - 25)/5)';
X = X0*cos(t);

imagesc(X)
map = TheBestColor('akun',41, 'map', 256);
colormap(map)
colorbar;
xlabel("Time")
ylabel("Position")

set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
set(gcf, 'unit', 'normalized', 'OuterPosition', [0.05 0.05 0.3 0.6])