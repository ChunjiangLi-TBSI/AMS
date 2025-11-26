m = 100;
L = 50;
dq = 2*pi/L;
lambda = 0.001;
q = 1:3*m;
qx = [pi/L/m*(1:m), pi/L*(1+zeros(1, m)), pi/L:-pi/L/m:pi/L/m];
qy = [zeros(1, m), pi/m*(1:m), pi:-pi/m:pi/m];

g_list = [0, 0.01, 0.1, 1];

bandstructure = zeros(m, 5);

for gg = 1:4
    g = g_list(gg);
    for i = q
        bandstructure(i, :) = eigen_frequency(lambda, qx(i), qy(i), dq, g);
    end
    
    sp = subplot(4, 2, 2*gg-1);
    
    p = get(sp, 'pos');
    p(1) = p(1) + 0.055;
    p(2) = p(2) - 0.01;
    p(3) = p(3) - 0.015;
    p(4) = p(4);
    set(sp, "pos", p);
    hold on
    plot(q, bandstructure(:, 1), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 2)
    plot(q, bandstructure(:, 2), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 2)
    plot(q, bandstructure(:, 3), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 2)
    plot(q, bandstructure(:, 4), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 2)
    plot(q, bandstructure(:, 5), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 2)
    set(gca, 'XTick', [0 100 200 300]);
    set(gca, 'XTickLabel', {'$\Gamma$', 'K', 'K$^\prime$', '$\Gamma$'}, 'TickLabelInterpreter', 'latex');
    set(gca, 'FontSize', 24)
    ax = gca;
    ax.Box = "on";
    ax.XAxis.LineWidth = 2;
    ax.YAxis.LineWidth = 2;
    ax.YLabel.String = "g = " + num2str(g);
    ax.YLabel.FontName = "Times New Roman";
    ax.YLabel.FontSize = 24;
    ax.YLabel.FontWeight = 'bold';
    ax.YLabel.Rotation = 0;
    yl = ax.YLabel;
    if gg == 2
        set(yl, 'unit', 'normalized',"Position", [-0.35 0.5]);
    elseif gg == 3
        set(yl, 'unit', 'normalized',"Position", [-0.37 0.5]);
    else
        set(yl, 'unit', 'normalized',"Position", [-0.4 0.5]);
    end
    
    if gg == 1
        ax.Title.String = "Band Structure";
        ax.Title.FontName = "Times New Roman";
        ax.Title.FontSize = 24;
        ax.Title.FontWeight = "bold";
    end
    set(gca, 'FontSize', 24, "FontName", "Times New Roman", "FontWeight", "bold")
    %ax.YLabel.String = "g = "+num2str(g);
    %ax.YLabel.Rotation = 0;
    yl_auto = ax.YLim;

    mmax = yl_auto(2);
    w = 0:mmax/1000:mmax;
    dos = zeros(1, length(w));
    for i = 1:length(w)
        for r = 1:3*m
            for c = 1:5
                dos(i) = dos(i) + normpdf(w(i), bandstructure(r, c), mmax/1000);
            end
        end
    end
    sp = subplot(4, 2, 2*gg);
    p = get(sp, 'pos');
    p(1) = p(1) + 0.05;
    p(2) = p(2) - 0.01;
    p(3) = p(3) - 0.015;
    p(4) = p(4);
    set(sp, "pos", p);
    plot(dos/sum(dos), w, "LineWidth",2, "Color", "#4F94CD");
    xlim([0 0.05])
    set(gca, 'XTick', [0 0.01 0.02 0.03 0.04 0.05]);
    ylim(yl_auto)
    set(gca, 'FontSize', 24)
    ax = gca;
    ax.Box = "on";
    ax.XAxis.LineWidth = 2;
    ax.YAxis.LineWidth = 2;
    if gg == 1
        ax.Title.String = "Density of State";
        ax.Title.FontName = "Times New Roman";
        ax.Title.FontSize = 24;
        ax.Title.FontWeight = "bold";
    end
    set(gca, 'FontSize', 24, "FontName", "Times New Roman", "FontWeight", "bold")
    
set(gcf, 'unit', 'normalized', 'OuterPosition', [0 0 0.5 1])
saveas(gcf, "band+DOS.tif", "tiffn")
end
