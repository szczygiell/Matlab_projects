function [h2, u] = DMC_sim(D, N, Nu, lambda, ss, steering_trajectory, F1_pp, h2_pp, h1_pp, FD, T)
    % Macierze startowe
    start = 81;
    ss(end:2000) = ss(end);

    steering = reshape(steering_trajectory, [length(steering_trajectory), 1]);
 
    Mp = zeros(N, D-1);
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
    K_dmc = inv(M' * M + lambda * eye(Nu)) * M';


    % empty matrices
    u = ones(length(steering_trajectory), 1) * F1_pp;
    h2 = ones(length(steering_trajectory), 1) * h2_pp;
    Y = zeros(N, 1); 
    h1 = h1_pp * ones(1, N);
    dUp = zeros((D-1), 1);

    % simulation loop
    for k=start:length(steering)
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
        Y(1:end) = h2(k-1);

        Y0 = Y + Mp*dUp;

        dU = K_dmc*(Yzad - Y0);
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
end
