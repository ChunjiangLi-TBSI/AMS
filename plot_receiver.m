n = 50;
m = 200;
t = 20001;

name = "periodic_sech_receiver_5";
load(name+".mat");

map = TheBestColor('akun',67, 'map', 256);
imagesc(receiver'/max(receiver,[],"all"))
shading interp
colormap(map);
cb = colorbar;

set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);

ax.Box = "off";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLabel.Rotation = 0;
ax.YLabel.Rotation = 0;
ax.TickDir = 'out';
xlabel("Time")
ylabel("Position")

set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
set(gcf, 'unit', 'normalized', 'OuterPosition', [0.05 0.05 0.4 0.6])
saveas(gcf, name+".tif", "tiffn")