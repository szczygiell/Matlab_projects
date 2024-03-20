function DMC(h_zad)
%     clear workspace
    T = 1;
    F1_pp = 52;
    FD(1:3500) = 13;
    % [h1_zlin, s_lin] = model_liniowy_od_pp(h_zad, F1_pp);
    [h1_zlin, s_lin] = model_liniowy_od_pp(F1_pp+1, F1_pp);
    [h1_pp, h2_pp] = model_od_zera(F1_pp);
    
    s = (s_lin - s_lin(1));
    D = 700; % Horyzont dynamiki
    N = 300; % Horyzont predykcji
    Nu = 2; % Horyzont sterowania
    lambda = 5; % Współczynnik kary
    iter = 3000;
    
    Y_zad(1:100,1) = h2_pp; 
    Y_zad(101:iter,1) = h_zad;
    % Y_zad(301:600,1) = 5;
    % Y_zad(601:1000,1) = 24;
   
    [h2, u] = DMC_sim(D, N, Nu, lambda, s, Y_zad, F1_pp, h2_pp, h1_pp, FD, T);

    E = sum((Y_zad - h2).^2)
    
    hold on
%     xlabel('k')
    yyaxis left
    ylabel('h2, h2_{zad}')
    stairs(real(h2))
    stairs(real(Y_zad(1:iter)))
    yyaxis right
    ylabel('u')
    ylim([0, 150])
    stairs(real(u))
    legend("DMC h2","h2_{zad}","DMC u",'location','southeast');
    
end
 