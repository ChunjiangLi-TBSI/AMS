load ratio.mat
hold on
map = TheBestColor('akun',10, 'map', 5);
for i = 1:5
    plot(ratio(i,:), "Color",map(mod(i, 5)+1,:), "LineWidth",4)
end
hold off

ax = gca;
ax.XLabel.String = "Pulse Center";
ax.YLabel.String = "Ratio";
ax.YLabel.Rotation = 0;
ax.XLabel.FontWeight = "bold";
ax.YLabel.FontWeight = "bold";
ax.XAxis.LineWidth = 3;
ax.YAxis.LineWidth = 3;
ax.Box = "on";

xlim([1 50]);
xticks([1 10 20 30 40 50]);
xticklabels([0 10 20 30 40 50])
ylim([0 1]);
yticks([0 0.2 0.4 0.6 0.8 1]);

set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')

lg = legend("AA1", "AA2", "AA3", "AA4", "AA5");
lg.Orientation = "horizontal";

set(gcf, 'unit', 'normalized', 'OuterPosition', [0.2 0.2 0.5 0.8])
saveas(gcf, "scan_position_ratio.tif", "tiffn")
