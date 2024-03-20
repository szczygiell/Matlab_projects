function [h2, u] = FDMC_SL_sim(D, N, Nu, lambda, steering_trajectory, F1_pp, h2_pp, h1_pp, FD, T, kind, amount_of_sets)
    % Macierze startowe
    start = 81;
    steering = reshape(steering_trajectory, [length(steering_trajectory), 1]);
    umax = 150 * ones(Nu,1);
    umin = 0 * ones(Nu,1);
    ymax = 50 * ones(N,1);
    ymin = 0 * ones(N,1);
    u = ones(length(steering_trajectory), 1) * F1_pp;
    h2 = ones(length(steering_trajectory), 1) * h2_pp;
    Y = zeros(N, 1); 
    Yk = zeros(N, 1); 
    dUp = zeros((D-1), 1);
    Y0 = [];
    dU = [];
    J = tril(ones(Nu));


    if amount_of_sets == 5
    F1_pp1 = 21;
    F1_pp2 = 44;
    F1_pp3 = 77;
    F1_pp4 = 103;
    F1_pp5 = 145;
    F1_pp = 52;
    pp = [21 44 77 103 145];
    
    
    [h1,s1] = model_rozmyty(F1_pp1, kind, amount_of_sets, pp);
    s1 = (s1 - s1(1))/(F1_pp1-F1_pp);

    [h1,s2] = model_rozmyty(F1_pp2, kind, amount_of_sets, pp);
    s2 = (s2 - s2(1))/(F1_pp2-F1_pp);

    [h1,s3] = model_rozmyty(F1_pp3, kind, amount_of_sets, pp);
    s3 = (s3 - s3(1))/(F1_pp3-F1_pp);

    [h1,s4] = model_rozmyty(F1_pp4, kind, amount_of_sets, pp);
    s4 = (s4 - s4(1))/(F1_pp4-F1_pp);

    [h1,s5] = model_rozmyty(F1_pp5, kind, amount_of_sets, pp);
    s5 = (s5 - s5(1))/(F1_pp5-F1_pp);
    % simulation loop
    s = {s1, s2, s3, s4, s5}; 
    end
    
    for k=start:length(steering)-1
        ss = zeros(1,1000);
        w = membership(h2(k-1), kind, amount_of_sets);
        for i = 1:amount_of_sets
            ss = ss + (w(i)*s{i});
        end
        for i=1:N
            for j=1:D-1
                Mp(i, j) = ss(j+i) - ss(j);
            end
        end
        M = zeros(N, Nu);
        for i=1:N
            for j=1:Nu
                if j > i
                    M(i, j) = 0;
                else
                    M(i, j) = ss(i-j+1);
                end
            end
        end
        % K_dmc = inv(M' * M + lambda * eye(Nu)) * M';
        if (N+k-1)>length(steering)
            Yzad = steering(k:end);
            Yzad(end:N) = steering(end);
        else
            Yzad = steering(k:(N+k-1));
        end

    
        for i=1:(D-1)
            if k-i-1 < 1
                dUp(i) = 0;
            else
                dUp(i) = u(k-i) - u(k-i-1);
            end
        end
       
        
        Yk(1:N) = h2(k-1);
              
        Y0 = Yk + Mp*dUp;

        fun = @(dU) (Yzad-Y0 - M*dU)'*(Yzad-Y0-M*dU)+lambda*dU'*dU;
        
A = [J; -J; -M; M];
b = [umax - u(k-1); -umin + u(k-1); ymax - Y0; -ymin + Y0];
H = 2 * (M' * M + lambda * eye(size(M, 2)));
f = -2 * (Yzad - Y0)' * M;
if k > 100
    a = 1;
end
% Rozwiązanie problemu optymalizacji
options = optimoptions('quadprog', 'Display', 'off');
dU_optimal = quadprog(H, f, A, b, [], [], [], [], [], options);
%
dU = dU_optimal;

        % K_dmc = inv(M' * M + lambda * eye(Nu)) * M';
        % dU = K_dmc*(Yzad - Y0);

        u(k) = u(k-1) + dU(1);
        
        if u(k) < 0
            u(k) = 0;
        elseif u(k) > 150
            u(k) = 150;
        end 
        [h1(k), h2(k)] = symulacja(h1(k-1), h2(k-1), u(k-80), FD(k-1), T);
        
        if h2(k) < 0
            h2(k) = 0;
        elseif h2(k) > 50
            h2(k) = 50;
        end
    end
    u(end) = u(end-1);
    h2(end) = h2(end-1);
end
