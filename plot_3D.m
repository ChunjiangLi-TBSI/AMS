load pulse_uniform_snapshots.mat

col1 = [72 118 255];
col2 = [205 0 0];
map = quadratic_colormap(col2, col1);
map = "pink";

[X, Y] = meshgrid(1:n, 1:m);

% 定义高度
Z1 = 1 * ones(size(X));
Z2 = 2 * ones(size(X));
Z3 = 3 * ones(size(X));

% 绘制
figure;
hold on;
surf(X, Z1, Y, snapshot1/max(snapshot1,[], 'all'), 'FaceAlpha', 1, 'EdgeColor', 'none');
surf(X, Z2, Y, snapshot2/max(snapshot2,[], 'all'), 'FaceAlpha', 1, 'EdgeColor', 'none');
surf(X, Z3, Y, snapshot3/max(snapshot3,[], 'all'), 'FaceAlpha', 1, 'EdgeColor', 'none');
shading interp
colormap(map);
colorbar;
view(60, 30);  % 调整视角
xlabel('X');
ylabel('Y');
zlabel('Layer');