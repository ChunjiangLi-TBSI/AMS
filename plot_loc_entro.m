load trivial_loc_entro.mat
load uniform_loc_entro.mat
load sech_loc_entro.mat

figure;
sp1 = subplot(1, 2, 1);
p = get(sp1, 'pos');
p(1) = p(1) - 0.035;
p(2) = p(2) + 0.01;
p(4) = p(4) - 0.02;
p(3) = p(3);
set(sp1, "pos", p);
title("Localization")
plot(smoothdata(loc_trivial),"Marker","." ,"LineStyle", "-","LineWidth",3, "Color", "#228B22");
set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'FontSize', 28)
ax = gca;
ax.Title.String = "Localization";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 28;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.YLim = [0 0.4];
ax.XLabel.String = "Time";
ax.XTickLabelRotation = 0;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
hold(sp1,"on")
plot(smoothdata(loc_uniform),"Marker","." ,"LineStyle", "-","LineWidth",3, "Color", "B");
plot(loc_sech,"Marker","." ,"LineStyle", "-","Color", "R", "LineWidth", 3);
hold(sp1,"off")


sp2 = subplot(1, 2, 2);
p = get(sp2, 'pos');
p(1) = p(1) - 0.1;
p(2) = p(2) + 0.01;
p(4) = p(4) - 0.02;
p(3) = p(3) + 0.15;
set(sp2, "pos", p);
plot(smoothdata(entro_trivial),"Marker","." ,"LineStyle", "-","LineWidth",3, "Color", "#228B22");
set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'FontSize', 28)
ax = gca;
ax.Title.String = "Entropy";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 28;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XTickLabelRotation = 0;
ax.YLim = [0.8 5.5];
ax.XLabel.String = "Time";

hold(sp2,"on")
plot(smoothdata(entro_uniform),"Marker","." ,"LineStyle", "-","LineWidth",3, "Color", "B");
plot(smoothdata(entro_sech),"Marker","." ,"LineStyle", "-","Color", "R", "LineWidth", 3);
lg = legend({"trivial", "uniform", "sech"}, "Location", "northwestoutside");
hold(sp2,"off")

set(gcf, 'unit', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.8])
saveas(gcf, "localization_entropy.tif", "tiffn")