function [h1_zlin, h2] = model_rozmyty(skok, kind, amount_of_sets, pp)
    % pp = (50/amount_of_sets)/2;
%     pp = [38 102 143];
    h2 = zeros(1,1000);
    [w] = membership(8, kind, amount_of_sets);
    for k = 1:1000
        for i = 1:amount_of_sets 
            [h1_zlin, h2_r] = model_liniowy_od_pp(skok, pp(i));            
            h2(k) = h2(k) + w(i)*h2_r(k);
        end
        [w] = membership(h2(k), kind, amount_of_sets);
    end
    % hold on
    % plot(1:1000, h2)
end

