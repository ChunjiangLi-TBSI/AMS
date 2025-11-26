function plot_bandstructure(q, band)
    hold on
    plot(q, band(:, 1), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 3)
    plot(q, band(:, 2), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 3)
    plot(q, band(:, 3), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 3)
    plot(q, band(:, 4), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 3)
    plot(q, band(:, 5), "LineStyle", "-", "Color", "#CD4F39", "LineWidth", 3)
    hold off
    ax = gca;
    ax.Box = "on";
    ax.XAxis.LineWidth = 2;
    ax.YAxis.LineWidth = 2;
    
    ylabel('Energy')
    ylim([0 0.05])
    set(gca, 'XTick', [0 100 200 300]);
    set(gca, 'XTickLabel', {'$\Gamma$', 'K', 'K$^\prime$', '$\Gamma$'}, 'TickLabelInterpreter', 'latex');
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
end