function [h1_zlin, h2] = model_liniowy_od_pp(skok, pp)
    A2=430; C1 = 0.85; alfa1 = 19; alfa2 = 23;  tau = 80; T = 1;
    F1_pp1 = 52;
    F1_pp = pp;
    F1in(1:1000) = skok;
    FD(1:1000) = 13;
    h1_pp1 = 11.7036;
    h2_pp1 = 7.9868;
    % [h1_pp1, h2_pp1] = model_od_zera(F1_pp1);
    if pp == 38
        h1_pp = 7.2050;
        h2_pp = 4.9168;
    elseif pp == 102
        h1_pp = 36.6343;
        h2_pp = 24.9966;
    elseif pp == 143
        h1_pp = 67.4127;
        h2_pp = 45.9340;
    else 
        [h1_pp, h2_pp] = model_od_zera(pp);
    end
    V1_pp1 = C1*h1_pp1^2;
    V2_pp1 = A2*h2_pp1;
    V1_pp = C1*h1_pp^2;
    V2_pp = A2*h2_pp;
    F3_pp = alfa2*sqrt(h2_pp1);
    F2_pp = alfa1*sqrt(h1_pp1);
    F1(1:1001) = F1_pp1;
    h2(1:1000) = h2_pp1;
    V1(1:1001) = V1_pp1; V2(1:1001) = V2_pp1;
    F3_zlin(1:1001) = F2_pp;
    F2_zlin(1:1001) = F3_pp;
    h1_zlin(1:1000) = h1_pp1;
    
    for k = 1:1000
        h1_zlin(k) = sqrt((V1_pp)/C1) + (V1(k) - V1_pp)*1/(2*C1*sqrt(V1_pp/C1));
        h2(k) = V2(k)/A2;
        F3_zlin(k) = alfa2*sqrt(h2_pp) + (h2(k) - h2_pp)*alfa2/(2*sqrt(h2_pp));
        F2_zlin(k) = alfa1*(sqrt(h1_pp)+(h1_zlin(k) - h1_pp)/(2*sqrt(h1_pp)));
        if k>tau
            F1(k) = F1in(k-tau);
        end
        V1(k+1) = T*(F1(k) + FD(k) - F2_zlin(k)) + V1(k);
        V2(k+1) = T*(F2_zlin(k) - F3_zlin(k)) + V2(k);
    
    end
      % hold on
%     s = h2(1:end)-h2(1);
       % plot(1:1000, h2)


end

