function [E_fuzzy] = FDMC_SL(h_zad, kind, amount_of_sets)
    T = 1;
    F1_pp = 52;
    % F1_pp2 = 105;
    % F1_pp3 = 180;
    FD(1:3500) = 13;
  
    [h1_pp, h2_pp] = model_od_zera(F1_pp);
    
    D = 700; % Horyzont dynamiki
    N = 200; % Horyzont predykcji
    Nu = 10; % Horyzont sterowania
    
    lambda = 10; % Współczynnik kary dla kolejnych regulatorów
    
    iter = 3000;
    
    Y_zad(1:100,1) = h2_pp; 
    Y_zad(101:iter,1) = h_zad;
    
    
    [h2, u] = FDMC_SL_sim(D, N, Nu, lambda, Y_zad, F1_pp, h2_pp, h1_pp, FD, T, kind, amount_of_sets);
    
    E_fuzzy = real(sum((Y_zad - h2).^2));
    
    hold on
    yyaxis left
    ylabel('h2, h2_{zad}')
    stairs(real(h2))
    stairs(real(Y_zad(1:iter)))
    yyaxis right
    ylabel('u')
    ylim([0, 150])
    stairs(real(u))
    legend("fuzzyDMC h2","h2_{zad}","fuzzyDMC u",'location','southeast');



end

