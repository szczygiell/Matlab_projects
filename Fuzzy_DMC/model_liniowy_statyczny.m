function model_liniowy_statyczny(punkty_lin)
    model_statyczny()
    for j = punkty_lin
        ys = [];
        us = [];
        for i=0:150
                [h1, h2] = model_liniowy_od_pp(i, j);
        
            us = [us, i];
            ys = [ys, h2(1000)];
        end
            stairs(us, ys)
            % plot([punkty_lin], [ys(38) ys(102) ys(143)], 'o')
    end
    ylabel('h2')
    xlabel('u')
    legend("model statyczny", 'liniowy model statyczny');
end

