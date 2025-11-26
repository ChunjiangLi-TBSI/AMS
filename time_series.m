function s = time_series(t)
    n = 50;
    s0 = sech((1:n) - 25)';
    if (t > 15) && (t < 30)
        s = circshift(s0, 0);
    elseif (t > 45) && (t < 60)
        s = circshift(s0, -10);
    elseif (t > 75) && (t < 90)
        s = circshift(s0, 20);
    elseif (t > 105) && (t < 120)
        s = circshift(s0, -20);
    elseif (t > 135) && (t < 150)
        s = circshift(s0, 10);
    elseif (t > 165) && (t < 180)
        s = circshift(s0, 0);
    else
        s = zeros(n, 1);
    end
end
