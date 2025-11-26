%% 3D band surfaces: Z = eigen_frequency(lambda, kx, ky, dq, g)
clear; clc;

% ---- parameters (与原脚本保持一致/兼容) ----
m = 100;                 %#ok<NASGU> % 原脚本里用于路径点；这里不再使用
L = 50;
dq = 2*pi/L;
lambda = 0.001;
g_list = [0.1];

% ---- kx, ky 网格：以 [-pi/L, pi/L] 为方形区域 ----
Nx = 121;                       % 网格密度（越大越细，计算越久）
Ny = 121;
kx = linspace(-pi/L, pi/L, Nx);
ky = linspace(-pi, pi, Ny);
[KX, KY] = meshgrid(kx, ky);

num_bands = 5;                  % eigen_frequency 返回的本征频数目（与你原代码一致）

% ---- 作图：每个 g 对应一个子图，展示 5 条能带的 3D 曲面 ----
tiledlayout(1,1,'Padding','compact','TileSpacing','compact');

for gg = 1:numel(g_list)
    g = g_list(gg);

    % 预分配 (Ny x Nx x num_bands)
    Bands = zeros(Ny, Nx, num_bands);

    % 逐点调用 eigen_frequency 计算频率（可改 parfor 加速）
    % 如果有并行工具箱，可把外层 for 改成 parfor
    for j = 1:Ny
        for i = 1:Nx
            % 你已有的核心本征频函数：返回 1x5 向量
            Bands(j,i,:) = eigen_frequency(lambda, KX(j,i), KY(j,i), dq, g);
        end
    end

    % --- 画图 ---
    ax = nexttile(gg);
    hold(ax, 'on');

    % 可选：底面作个“零频平面”做参照
    surf(ax, KX, KY, zeros(size(KX)), ...
        'EdgeColor','none', 'FaceAlpha', 0.05);

    for b = 1:num_bands
        Z = Bands(:,:,b);
        Z(~isfinite(Z)) = NaN;
        s = surf(ax, KX, KY, Z, Z);         % 第4个参数设置 CData=Z
        s.EdgeColor = 'none';
        s.FaceColor = 'interp';             % 插值着色，颜色随 Z 变化
        s.FaceAlpha = 1;                  % 可调，避免遮挡
    end

    % 轴与外观
    % xlabel(ax, 'k_x (arb.)', 'FontName','Times New Roman');
    % ylabel(ax, 'k_y (arb.)', 'FontName','Times New Roman');
    % zlabel(ax, 'Frequency (arb.)', 'FontName','Times New Roman');

    title(ax, sprintf('3D Bands, g = %g', g), ...
        'FontName','Times New Roman','FontWeight','bold');

    grid(ax, 'on');
    box(ax, 'on');
    ax.LineWidth = 1.5;
    ax.FontName = 'Times New Roman';
    ax.FontSize = 12;

    % 视角与范围（可自行调整）
    view(ax, [-45 25]);          % 角度
    xlim([-pi/L, pi/L]);
    ylim([-pi, pi]);
    zlim(ax, [0 0.25]);
    colormap(ax);

    % 可选：在底面标记 Γ、M、K（近似位置，按你晶格定义调整）
    % 这里给出常见三角晶格的一个示意（需按你体系单位核对）：
    % Gamma = (0,0)
    %plot3(ax, 0, 0, ax.ZLim(1), 'ko', 'MarkerFaceColor','r', 'MarkerSize',6);
    %text(ax, 0, 0, ax.ZLim(1), ' \Gamma', 'VerticalAlignment','top','FontName','Times New Roman');

    % 下面两点仅作示意，你可替换为体系的精确 M、K 坐标：
    % M ~ (pi/L, 0)
    %plot3(ax, -pi/L, 0, ax.ZLim(1), 'ko', 'MarkerFaceColor','r', 'MarkerSize',6);
    %text(ax, -pi/L, 0, ax.ZLim(1), '  M', 'VerticalAlignment','top','FontName','Times New Roman');

    % K ~ (2*pi/(3*L), 2*pi/(3*sqrt(3)*L))  (六角/三角晶格常见定义之一；请按实际修正)
    %plot3(ax, -pi/L, -pi, ax.ZLim(1), 'ko', 'MarkerFaceColor','r', 'MarkerSize',6);
    %text(ax, -pi/L, -pi, ax.ZLim(1), '  K', 'VerticalAlignment','top','FontName','Times New Roman');

    
    hold(ax, 'off');
    
end

% 导出高分辨率图片（可改成 .tif/.eps/.pdf）
%set(gcf, 'Color','w');
exportgraphics(gcf, 'bands_3D_grid_g_list.png', 'Resolution', 300);
