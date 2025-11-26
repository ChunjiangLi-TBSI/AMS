function map = quadratic_colormap(col1, col2)
    col1 = col1/256;
    col2 = col2/256;
    map = zeros(256, 3);
    a = col1 - col2;
    for i = 1:256
        map(i, :) = a * ((i-1)/256) + col2;
    end
end