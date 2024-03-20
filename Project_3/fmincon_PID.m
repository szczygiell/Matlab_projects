function x_optimal = fmincon_PID()
%fmincon
objective = @(x) PID (x(1), x(2), x(3));
% x_initial = [0.2, 8.5, 1.76];
x_initial = [0.9, 11.5, 2.76];
lb = [0, 0.001, 0];
ub = [5, 30, 10];

nonlcon = [];

options = optimoptions('fmincon', 'Display', 'iter');
[x_optimal, fval] = fmincon(objective, x_initial, [], [], [], [], lb, ub, nonlcon, options);


    function E = PID(K_pid, Ti, Td)

        kmax = 1000;

        x1 = zeros(kmax, 1);
        x2 = zeros(kmax, 1);

        % inicjalizacja:
        T = 0.5;
        start = 7;
        e(1:19) = 0;
        u = zeros(kmax, 1);
        y = zeros(kmax, 1);
        yzad = zeros(kmax, 1);
        yzad(40:kmax) = 0.8;
        yzad(150:kmax) = -4.5;
        yzad(300:kmax) = -0.5;
        yzad(400:kmax) = -2.5;
        yzad(550:kmax) = 0.5;
        yzad(700:kmax) = -2.0;
        yzad(850:kmax) = 0;


        r0 = K_pid*(1+T/(2*Ti) +Td/T);
        r1 = K_pid*(T/(2*Ti)-2*Td/T-1);
        r2 = K_pid*Td/T;

        for k = start:kmax
            g1 = (exp(7.5*u(k-5))-1)/(exp(7.5*u(k-5))+1);
            x1(k) = 1.626651*x1(k-1) + x2(k-1) + 0.013274 * g1;
            x2(k) = -0.657673*x1(k-1) + 0.011544 * g1;
            g2 = 1.25*(1-exp(-2*x1(k)));
            y(k) = g2;
            e(k) = yzad(k)-y(k);
            u(k) = r2*e(k-2) + r1*e(k-1) + r0*e(k) + u(k-1);

            if u(k) < -1
                u(k) = -1;
            elseif u(k)>1
                u(k) = 1;
            end
        end

        % wskaźnik jakości regulacji
        E = 0;
        for k = 1 : kmax
            E = E + (yzad(k)-y(k))^2;
        end
    end
end


