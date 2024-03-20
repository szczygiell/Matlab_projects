
function [h1_pp, h2_pp] = model_od_zera(skok)
    h1 = zeros(1700,1);h2 = zeros(1700,1);
    F1in(1:1700) = skok;
    FD(1:80) = 0;
    FD(81:1700) = 13;
    for k = 81:1700
        [h1(k), h2(k)] = symulacja(h1(k-1), h2(k-1), F1in(k-80),FD(k-1), 1);
    end
    h1_pp = h1(end);
    h2_pp = h2(end);
    % hold on
    % plot(1:2000, h1)
    % plot(1:2000, h2)
    % legend("h1","h2");
end
