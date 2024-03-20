function [E_fuzzy] = fuzzy_DMC(h_zad)
    T = 1;
    F1_pp1 = 21;
    F1_pp2 = 44;
    F1_pp3 = 77;
    F1_pp4 = 103;
    F1_pp5 = 145;
    F1_pp = 52;
    pp = [20 43 76 102 145];
    % F1_pp2 = 105;
    % F1_pp3 = 180;
    FD(1:3500) = 13;
    

    [h1,s1] = model_rozmyty(F1_pp1, 1, 5, pp);
    s1 = (s1 - s1(1))/(F1_pp1-F1_pp);

    [h1,s2] = model_rozmyty(F1_pp2, 1, 5, pp);
    s2 = (s2 - s2(1))/(F1_pp2-F1_pp);

    [h1,s3] = model_rozmyty(F1_pp3, 1, 5, pp);
    s3 = (s3 - s3(1))/(F1_pp3-F1_pp);

    [h1,s4] = model_rozmyty(F1_pp4, 1, 5, pp);
    s4 = (s4 - s4(1))/(F1_pp4-F1_pp);

    [h1,s5] = model_rozmyty(F1_pp5, 1, 5, pp);
    s5 = (s5 - s5(1))/(F1_pp5-F1_pp);


    [h1_pp, h2_pp] = model_od_zera(F1_pp);
    
    D = 700; % Horyzont dynamiki
    N = 300; % Horyzont predykcji
    Nu = 2; % Horyzont sterowania
    
    lambda = {100, 0.01, 0.1, 1, 1000}; % Współczynnik kary dla kolejnych regulatorów
    ss = {s1, s2, s3, s4, s5}; 
    
    iter = 3000;
    
    Y_zad(1:100,1) = h2_pp; 
    Y_zad(101:iter,1) = h_zad;
    
    
    [h2, u] = fuzzy_DMC_sim(D, N, Nu, lambda, ss, Y_zad, F1_pp, h2_pp, h1_pp, FD, T, 1, 5);
    
    E_fuzzy = real(sum((Y_zad - h2).^2));
    
%     hold on
%     stairs(h2)
%     stairs(u)
%     stairs(Y_zad(1:iter))
%     legend("DMC h2","DMC u","Yzad");
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
    legend("fuzzyDMC h2","h2_{zad}","fuzzyDMC u",'location','southeast');
    

end

