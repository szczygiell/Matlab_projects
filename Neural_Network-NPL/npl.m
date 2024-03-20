clear all;
close all;
run uczenie/model4_bfgs_oe.m
load w.mat

N=15;
Nu = 3;
lambda = 500;

ifnpl = 0;

kmax = 500;

u = zeros(kmax, 1);
y = zeros(kmax, 1);
yzad = zeros(kmax, 1);
yzad(40:kmax) = 0.8;
yzad(150:kmax) = -0.5;
yzad(300:kmax) = -2.5;

x1 = zeros(kmax, 1);
x2 = zeros(kmax, 1);

b=zeros(6, 1);
b(1) = 0;
b(2) = 0;
b(3) = 0;
b(4) = 0;
b(5) = w(1);
b(6) = w(2);

a=zeros(2, 1);
a(1) = -w(3);
a(2) = -w(4);

s = zeros(N, 1);

M = zeros(N, Nu);

if ifnpl == 0

    for p=1:N
        sum_b = 0;
        sum_a = 0;
        for i=1:min(p, 6)
            sum_b = sum_b + b(i);
        end
        for i=1:min(p-1, 2)
            sum_a = sum_a + a(i)*s(p-i);
        end

        s(p) = sum_b - sum_a;
    end

    % Macierze M i K dla danej chwili k
    for i=1:N
        for j=1:Nu
            if j > i
                M(i, j) = 0;
            else
                M(i, j) = s(i-j+1);
            end
        end
    end

    K = inv(M' * M + lambda * eye(Nu)) * M';

    for k=7:kmax
        g1 = (exp(7.5*u(k-5))-1)/(exp(7.5*u(k-5))+1);
        x1(k) = 1.626651*x1(k-1) + x2(k-1) + 0.013274 * g1;
        x2(k) = -0.657673*x1(k-1) + 0.011544 * g1;
        g2 = 1.25*(1-exp(-2*x1(k)));
        y(k) = g2;
        % y(k)=b(5)*u(k-5)+b(6)*u(k-6)-a(1)*y(k-1)-a(2)*y(k-2); % ARX

        y_mod(k)=b(5)*u(k-5)+b(6)*u(k-6)-a(1)*y(k-1)-a(2)*y(k-2); % ARX

        % Obliczenie d
        d = y(k) - y_mod(k);

        %Trajektoria swobodna
        y_k = b(5)*u(k-4)+b(6)*u(k-5)-a(1)*y(k)-a(2)*y(k-1);
        yo(1) = y_k + d;
        y_k = b(5)*u(k-3)+b(6)*u(k-4)-a(1)*yo(1)-a(2)*y(k);
        yo(2) = y_k + d;
        y_k = b(5)*u(k-2)+b(6)*u(k-3)-a(1)*yo(2)-a(2)*yo(1);
        yo(3) = y_k + d;
        y_k = b(5)*u(k-1)+b(6)*u(k-2)-a(1)*yo(3)-a(2)*yo(2);
        yo(4) = y_k + d;

        for i=5:N
            y_k = b(5)*u(k-1)+b(6)*u(k-1)-a(1)*yo(i-1)-a(2)*yo(i-2);
            yo(i) = y_k + d;
        end

        Y_zad(1:N) = yzad(k);

        dU = K * (Y_zad' - yo');

        u(k) = dU(1) + u(k-1);

        % Ograniczenia
        if u(k) > 1
            u(k) = 1;
        elseif u(k) < -1
            u(k) = -1;
        end

    end
end



if ifnpl == 1
    for k=7:kmax

        % Pomiar y
        [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), u(k-5));


        q = [u(k-5) u(k-6) y(k-1) y(k-2)]';
        y_mod(k) = w20 + w2*tanh(w10 + w1*q);

        % Obliczenie d
        d(k) = y(k) - y_mod(k);

        % Trajektoria swobodna
        q = [u(k-4) u(k-5) y(k) y(k-1)]';
        y_k = w20 + w2*tanh(w10 + w1*q);
        yo(1) = y_k + d(k);
        q = [u(k-3) u(k-4) yo(1) y(k)]';
        y_k = w20 + w2*tanh(w10 + w1*q);
        yo(2) = y_k + d(k);
        for i=3:N
            if k-5+i <=kmax
                if i < 5
                    q = [u(k-5+i) u(k-6+i) yo(i-1) yo(i-2)]';
                else
                    q = [u(k-1) u(k-1) yo(i-1) yo(i-2)]';
                end
                y_k = w20 + w2*tanh(w10 + w1*q);
                yo(i) = y_k + d(k);
            end
        end

        % Linearyzacja
        delta = 10e-5;
        q = [u(k-5)+delta u(k-6) y_mod(k-1) y_mod(k-2)]';
        b(5) = (w20 + w2*tanh(w10 + w1*q)-y_mod(k))/delta;

        q = [u(k-5) u(k-6)+delta y_mod(k-1) y_mod(k-2)]';
        b(6) = (w20 + w2*tanh(w10 + w1*q)-y_mod(k))/delta;

        q = [u(k-5) u(k-6) y_mod(k-1)+delta y_mod(k-2)]';
        a(1) = -(w20 + w2*tanh(w10 + w1*q)-y_mod(k))/delta;

        q = [u(k-5) u(k-6) y_mod(k-1) y_mod(k-2)+delta]';
        a(2) = -(w20 + w2*tanh(w10 + w1*q)-y_mod(k))/delta;


        y_lin(k) = b(5)*u(k-5)+b(6)*u(k-6)+a(1)*y_mod(k-1)+a(2)*y_mod(k-2);


        % Obliczanie S

        for p=1:N
            sum_b = 0;
            sum_a = 0;
            for i=1:min(p, 6)
                sum_b = sum_b + b(i);
            end
            for i=1:min(p-1, 2)
                sum_a = sum_a + a(i)*s(p-i);
            end

            s(p) = sum_b - sum_a;
        end

        % Macierze M i K dla danej chwili k
        for i=1:N
            for j=1:Nu
                if j > i
                    M(i, j) = 0;
                else
                    M(i, j) = s(i-j+1);
                end
            end
        end

        K = inv(M' * M + lambda * eye(Nu)) * M';

        % Obliczenie wektora zmiennych decyzyjnych
        Y_zad(1:N) = yzad(k);

        dU = K * (Y_zad' - yo');

        u(k) = dU(1) + u(k-1);

        % Ograniczenia
        if u(k) > 1
            u(k) = 1;
        elseif u(k) < -1
            u(k) = -1;
        end
    end
end


% plot(y_mod)
figure(2)
plot(u)
figure(3)
hold on;
plot(yzad, '-')
plot(y)
% plot(y_lin)
% plot(y_mod)
legend('yzad', 'y')





