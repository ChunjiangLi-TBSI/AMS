n = 50;
m = 200;
map = TheBestColor('akun',67, 'map', 256);
[X, Y] = meshgrid(1:n, 1:m);

pos = [-5, -3, 0, 3, 5];
figure;
hold on;

for i = 1:5
    name = "scan_pos_"+num2str(pos(i));
    load(name+".mat");
    Z = i * ones(size(X));
    sp = subplot(1, 5, i);
    p = get(sp, 'pos');
    p(1) = p(1) - 0.035;
    p(2) = p(2) + 0.01;
    p(3) = p(3) + 0.025;
    set(sp, "pos", p);

    hold on
    surf(X, Z, Y, snapshot/max(snapshot,[], 'all'), 'FaceAlpha',1);
    shading interp
    colormap(map)
    plot3(ones(size(1:200))*15, ones(size(1:200))*i, 1:200, "LineWidth",2, "Color","Y","LineStyle","--")
    plot3(ones(size(1:200))*25, ones(size(1:200))*i, 1:200, "LineWidth",2, "Color","Y","LineStyle","--")
    plot3(ones(size(1:200))*35, ones(size(1:200))*i, 1:200, "LineWidth",2, "Color","Y","LineStyle","--")
    % plot3(ones(size(150:200))*15, ones(size(150:200))*i, 150:200, "LineWidth",2, "Color","Y","LineStyle","--")
    % plot3(ones(size(150:200))*25, ones(size(150:200))*i, 150:200, "LineWidth",2, "Color","Y","LineStyle","--")
    % plot3(ones(size(150:200))*35, ones(size(150:200))*i, 150:200, "LineWidth",2, "Color","Y","LineStyle","--")
    % plot3(1:n, ones(size(X))*i,ones(size(X))*150, "LineWidth",2, "Color","Y","LineStyle","--")
    % plot3(1:n, ones(size(X))*i,ones(size(X))*130, "LineWidth",2, "Color","Y","LineStyle","--")
    plot3(1:n, ones(size(X))*i,5+15*circshift(sech(((1:n) - 25)/5), pos(i)), "LineWidth",3, "Color","G","LineStyle","-")


    view(0, 0);
    ax = gca;
    if i == 1
        ax.ZLabel.String = {'Travel', 'Length'};
        ax.ZLabel.Position = [-20 0 90];
    end

    if i == 3
        ax.XLabel.String = 'Position';
        ax.XLabel.Position = [35 0 -15];
    end
    ax.ZLabel.Rotation = 0;
    ax.XLabel.Rotation = 0;
    ax.XLabel.FontWeight = 'bold';
    ax.YLabel.FontWeight = 'bold';
    ax.ZLabel.FontWeight = 'bold';
    ax.XAxis.LineWidth = 2;
    ax.YAxis.LineWidth = 2;
    ax.ZAxis.LineWidth = 2;
    ax.TickDir = 'out';
    
    xlim([1 50]);
    zlim([1 200]);
    xticks([15 25 35]);
    xticklabels([15 25 35]);
    xtickangle(0);
    zticks([1 40 80 120 160 200]);
    if i == 1
        zticklabels([0 40 80 120 160 200])
    else
        zticklabels([]);
    end
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 28, 'FontWeight', 'bold')
end


cb = colorbar;
clim([0 1]);
cb.Label.String = {'Normalized', 'Intension'};
cb.Label.FontSize = 28;
cb.Label.FontWeight = 'bold';
cb.Label.Rotation = 0;
cb.Ticks = [0 0.2 0.4 0.6 0.8 1];
cb.Position = [0.95 0.12 0.01 0.7];
cb.Label.Position = [0 1.2 0];
set(gcf, 'unit', 'normalized', 'OuterPosition', [0 0.05 1 0.8], 'InnerPosition', [0 0.2 0.9 0.6])
saveas(gcf, "scan_position_snapshot.tif", "tiffn")