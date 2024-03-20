
function [h1, h2] = model_od_pp(skok)
    F1_pp = 52;
    [h1_pp, h2_pp] = model_od_zera(F1_pp);
    F1in(1:2000) = skok;
    FD(1:2000) = 13;
    h1(1:1000) = h1_pp; h2(1:1000) = h2_pp;
    for k = 81:2000
        [h1(k), h2(k)] = symulacja(h1(k-1), h2(k-1), F1in(k-80),FD(k-1), 1);
    end
    % hold on
    % plot(1:2000, h2)
    % legend("h1",'location','southeast
