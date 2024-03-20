function [h2, u] = fuzzy_DMC_sim(D, N, Nu, lambda, ss, steering_trajectory, F1_pp, h2_pp, h1_pp, FD, T, kind_of_sets, amount_of_sets)
    % Macierze startowe
    start = 81;
    steering = reshape(steering_trajectory, [length(steering_trajectory), 1]);
    Mp = cell(amount_of_sets, 1);
    M = cell(amount_of_sets, 1);
    K_dmc = cell(amount_of_sets, 1);

    for r=1:amount_of_sets
        ss{r}(end:2000) = ss{r}(end);
        
        
        
        Mp{r} = zeros(N, D-1);
        for i=1:N
            for j=1:D-1
                Mp{r}(i, j) = ss{r}(j+i) - ss{r}(j);
            end
        end
        M{r} = zeros(N, Nu);
        for i=1:N
            for j=1:Nu
                if j > i
                    M{r}(i, j) = 0;
                else
                    M{r}(i, j) = ss{r}(i-j+1);
                end
            end
        end
        K_dmc{r} = inv(M{r}' * M{r} + lambda{r} * eye(Nu)) * M{r}';
    end


    % empty matrices

    u = ones(length(steering_trajectory), 1) * F1_pp;
    h2 = ones(length(steering_trajectory), 1) * h2_pp;
    h1 = h1_pp * ones(1, N);
    Y = zeros(N, 1); 
    dUp = zeros((D-1), 1);
    Y0 = cell(3, 1);
    dU = cell(3, 1);
    

    % simulation loop
    for k=start:length(steering)
        final_dU = 0;
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
        
        for r=1:amount_of_sets
            
            Y0{r} = Y + Mp{r}*dUp;

            dU{r} = K_dmc{r}*(Yzad - Y0{r});
        end
           
        w = membership(h2(k-1),kind_of_sets, amount_of_sets);
        for r=1:amount_of_sets
            final_dU = final_dU + (w(r) * dU{r}(1));
        end
        final_dU = final_dU/sum(w);
        u(k) = u(k-1) + final_dU;
        
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
