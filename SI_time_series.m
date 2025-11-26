load time_series_output.mat

map = TheBestColor('akun',10, 'map', 5);

t = 20001;
input = zeros(5, t);

for i = 1:t
    tt = (i-1)/100;
    if (tt > 10) && (tt < 20)
        input(3,i) = 1;
    elseif (tt > 30) && (tt < 40)
        input(2,i) = 1;
    elseif (tt > 50) && (tt < 60)
        input(5,i) = 1;
    elseif (tt > 70) && (tt < 80)
        input(1,i) = 1;
    elseif (tt > 90) && (tt < 100)
        input(4,i) = 1;
    elseif (tt > 110) && (tt < 120)
        input(3,i) = 1;
    end
end

%%
figure;
subplot(2, 2, 1)
hold on 
for i = 1:5
    %plot(i+0.9*input(i,:), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    plot(i+0.9*input(i,:), "Marker", ".", "Color",map(mod(i, 5)+1,:), "LineWidth",2)
end
hold off

set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'YTick', [1 2 3 4 5]);
set(gca, 'YTickLabel',["AA1" "AA2" "AA3" "AA4" "AA5"]);
set(gca, 'FontSize', 16)
ax = gca;
ax.Title.String = "Input Signal";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 16;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLim = [0.05e4 2e4];
ax.YLim = [0.5 6.5];
ax.XLabel.String = "Time";
ax.XTickLabelRotation = 0;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16, 'FontWeight', 'bold')

%%
subplot(2, 2, 2)
hold on 
for i = 1:5
    %plot(i+0.9*input(i,:), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    plot(i+1.2*output(i,:), "Marker", ".", "Color",map(mod(i, 5)+1,:), "LineWidth",2)
end
hold off

set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'YTick', [1 2 3 4 5]);
set(gca, 'YTickLabel',["AA1" "AA2" "AA3" "AA4" "AA5"]);
set(gca, 'FontSize', 16)
ax = gca;
ax.Title.String = "Direct Output Signal";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 16;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLim = [0.05e4 2e4];
ax.YLim = [0.5 6.5];
ax.XLabel.String = "Time";
ax.XTickLabelRotation = 0;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16, 'FontWeight', 'bold')

%%
subplot(2, 2, 3)
hold on 
for i = 1:5
    %plot(i+0.9*output(i,:), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    %plot(i+circshift(0.9*input(i,:), 7000), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    plot(i+circshift(1.5*filter(b, a, output(i, :)), 0), "Marker", ".", "Color",map(mod(i, 5)+1,:), "LineWidth",2)
end
hold off

set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'YTick', [1 2 3 4 5]);
set(gca, 'YTickLabel',["AA1" "AA2" "AA3" "AA4" "AA5"]);
set(gca, 'FontSize', 16)
ax = gca;
ax.Title.String = "Output Signal After Low-pass Filter";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 16;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLim = [0.05e4 2e4];
ax.YLim = [0.5 6.5];
ax.XLabel.String = "Time";
ax.XTickLabelRotation = 0;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16, 'FontWeight', 'bold')

%%
subplot(2, 2, 4)
hold on 
for i = 1:5
    %plot(i+0.9*output(i,:), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    %plot(i+circshift(0.9*input(i,:), 7000), "Color",map(mod(i, 5)+1,:), "LineWidth",3)
    s = filter(b, a, output(i, :));
    s(s>0.12)=1;
    s(s<=0.12)=0;
    plot(i+circshift(0.9*s, 0), "Marker", ".", "Color",map(mod(i, 5)+1,:), "LineWidth",2)
end
hold off

set(gca, 'XTick', [0 0.5e4 1e4 1.5e4 2e4]);
set(gca, 'XTickLabel',[0 1 2 3 4]);
set(gca, 'YTick', [1 2 3 4 5]);
set(gca, 'YTickLabel',["AA1" "AA2" "AA3" "AA4" "AA5"]);
set(gca, 'FontSize', 16)
ax = gca;
ax.Title.String = "Output Signal After Low-pass Filter and Comparator";
ax.Title.FontName = 'Times New Roman';
ax.Title.FontSize = 16;
ax.Title.FontWeight = 'bold';
ax.Box = "on";
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.XLim = [0.05e4 2e4];
ax.YLim = [0.5 6.5];
ax.XLabel.String = "Time";
ax.XTickLabelRotation = 0;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16, 'FontWeight', 'bold')
