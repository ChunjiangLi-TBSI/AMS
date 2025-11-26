n = 50;
m = 200;

name = "pulse_uniform_trivial_snapshots";
load(name+".mat");

map = TheBestColor('akun',67, 'map', 256);
%map = flip(map, 1);
%map = map(60:180, :);
[X, Y] = meshgrid(1:n, 1:m);

Z1 = 1 * ones(size(X));
Z2 = 2 * ones(size(X));
Z3 = 3 * ones(size(X));

figure;
hold on;
surf(X, Z3, Y, snapshot3/max(snapshot3,[], 'all'), 'FaceAlpha',1);
surf(X, Z2, Y, snapshot2/max(snapshot2,[], 'all'), 'FaceAlpha',1);
surf(X, Z1, Y, snapshot1/max(snapshot1,[], 'all'), 'FaceAlpha',1);
shading interp
colormap(map);

cb = colorbar;
cb.Label.String = {'Normalized', 'Intension'};
cb.Label.FontSize = 28;
cb.Label.FontWeight = 'bold';
cb.Label.Rotation = 0;
cb.Ticks = [0 0.2 0.4 0.6 0.8 1];
cb.Position = [0.95 0.12 0.01 0.7];
cb.Label.Position = [-0.7 1.2 0];

ax = gca;
ax.XLabel.String = 'Position';
ax.XLabel.Position = [50 0.5 1];
ax.YLabel.String = 'Time';
ax.YLabel.Position = [50 2 -15];
ax.ZLabel.String = {'Travel', 'Length'};
ax.ZLabel.Position = [50 -0.25 120];
ax.ZLabel.Rotation = 0;
ax.XLabel.FontWeight = 'bold';
ax.YLabel.FontWeight = 'bold';
ax.ZLabel.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.ZAxis.LineWidth = 2;
%ax.TickDir = 'in';

view(65, 10);
xlim([0 50]);
ylim([1 3]);
zlim([0 200]);
xticks([10 20 30 40 50]);
yticks([1 2 3]);
yticklabels([5, 10, 15]);
zticks([0 40 80 120 160 200]);
set(gcf, 'unit', 'normalized', 'OuterPosition', [0.05 0.05 0.95 0.7], 'InnerPosition', [0.25 0.1 0.7 0.6])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')

saveas(gcf, name+".tif", "tiffn")