loc_sech = load("periodic_loc_sech.mat", "loc_sech");
loc_sech_5 = load("periodic_loc_sech_5.mat", "loc_sech");
loc_uniform = load("periodic_loc_uniform.mat", "loc_uniform");
loc_uniform_5 = load("periodic_loc_uniform_5.mat", "loc_uniform");

figure;
sp1 = subplot(1, 2, 1);
p = get(sp1, 'pos');
p(1) = p(1) - 0.035;
p(2) = p(2) + 0.01;
p(4) = p(4) - 0.02;
p(3) = p(3) - 0.01;
set(sp1, "pos", p);
title("Localization")
plot(smoothdata(loc_uniform.loc_uniform),"LineStyle", "-","LineWidth",3, "Color", "B");
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
plot(smoothdata(loc_sech.loc_sech),"LineStyle", "-","LineWidth",3, "Color", "R");
hold(sp1,"off")


sp2 = subplot(1, 2, 2);
p = get(sp2, 'pos'); 
p(1) = p(1) - 0.1;
p(2) = p(2) + 0.01;
p(4) = p(4) - 0.02;
p(3) = p(3) + 0.13;
set(sp2, "pos", p);
title("Localization")
plot(smoothdata(loc_uniform_5.loc_uniform),"LineStyle", "-","LineWidth",3, "Color", "B");
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
hold(sp2,"on")
plot(smoothdata(loc_sech_5.loc_sech),"LineStyle", "-","LineWidth",3, "Color", "R");
hold(sp2,"off")
lg = legend({"uniform", "sech"}, "Location", "northwestoutside");
hold(sp2,"off")
set(gcf, 'unit', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.8])
saveas(gcf, "periodic_loc.tif", "tiffn")