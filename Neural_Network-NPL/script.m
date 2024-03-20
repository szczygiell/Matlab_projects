%% Charakterystyka statyczna
u = -1:0.01:1;
Y = zeros(201, 1);
for i=1:201
    uk = ones(300, 1)*u(i);
    y = zeros(300, 1);
    x1 = zeros(300, 1);
    x2 = zeros(300, 1);
    for k=6:300
        [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), uk(k-5));
    end
    Y(i) = y(end, 1);
end
plot(u, Y)
grid on
xlabel('u')
ylabel('y')
% print (['char_stat.png' ], '-dpng', '-r400')

%% Zbieranie danych

% u = -1:0.0005:1;
% dane_ucz = zeros(2001, 2);
% dane_wer = zeros(2000, 2);
% j=1;
% for i=1:4001
%     uk = ones(150, 1)*u(i);
%     y = zeros(150, 1);
%     x1 = zeros(150, 1);
%     x2 = zeros(150, 1);
%     for k=6:150
%         [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), uk(k-5));
% 
%     end
%     plot(y)
%     if mod(i, 2)
%         dane_ucz(j, 1) = y(end, 1);
%         dane_ucz(j, 2) = uk(end, 1);
%     else
%         dane_wer(j, 1) = y(end, 1);
%         dane_wer(j, 2) = uk(end, 1);
%         j = j + 1;
%     end
% end

u = 0;
dane_ucz = zeros(2000, 2);
dane_wer = zeros(2000, 2);
uk = zeros(2000, 1);
y = zeros(2000, 1);
x1 = zeros(2000, 1);
x2 = zeros(2000, 1);
j=1;
for k=6:2005
    if mod(k,60) == 0
        umin=-1;
        umax=1;
        u=umin+rand(1,1)*(umax-umin);
    end
    uk(k) = u;
    [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), uk(k-5));
        dane_ucz(j, 1) = y(k, 1);
        dane_ucz(j, 2) = uk(k, 1);
        j = j + 1;
end
u = 0;
uk = zeros(2000, 1);
y = zeros(2000, 1);
x1 = zeros(2000, 1);
x2 = zeros(2000, 1);
j=1;
for k=6:2005
    if mod(k,60) == 0
        umin=-1;
        umax=1;
        u=umin+rand(1,1)*(umax-umin);
    end
    uk(k) = u;
    [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), uk(k-5));
        dane_wer(j, 1) = y(k, 1);
        dane_wer(j, 2) = uk(k, 1);
        j = j + 1;
end

figure;
sgtitle('Dane weryfikujące');
subplot(2,1,1); 
plot(dane_wer(:, 1))
title('wyjście');
subplot(2,1,2); 
plot(dane_wer(:, 2))
title('sterowanie');
print (['dane_wer2.png' ], '-dpng', '-r400')
figure;
sgtitle('Dane uczące');
subplot(2,1,1); 
plot(dane_ucz(:, 1));
title('wyjście');
subplot(2,1,2); 
plot(dane_ucz(:, 2))
title('sterowanie');
print (['dane_ucz2.png' ], '-dpng', '-r400')

%% Opóźnienie
uk = zeros(300, 1);
uk(1:300, 1) = 0.5;
y = zeros(300, 1);
x1 = zeros(300, 1);
x2 = zeros(300, 1);
for k=6:300
    [y(k), x1(k), x2(k)] = model_procesu(x1(k-1), x2(k-1), uk(k-5));
end
plot(y)
% opożnienie równe jest 5

%% Weryfikacja sieci neuronowej
clear workspace;
format longE
run uczenie/uczenie4_bfgs_oe.m
run uczenie/model4_bfgs_oe.m

load dane_wer_2.mat
load dane_ucz_2.mat

u = dane_wer(:, 2);
y = dane_wer(:, 1);
y_mod = y;

for k=7:2000
    q = [u(k-5) u(k-6) y_mod(k-1) y_mod(k-2)]';
    y_mod(k) = w20 + w2*tanh(w10 + w1*q);
end

u_ucz = dane_ucz(:, 2);
y_ucz = dane_ucz(:, 1);
y_mod_ucz = y_ucz;

for k=7:2000
    q = [u_ucz(k-5) u_ucz(k-6) y_mod_ucz(k-1) y_mod_ucz(k-2)]';
    y_mod_ucz(k) = w20 + w2*tanh(w10 + w1*q);
end

E_wer = (y_mod - y)' * (y_mod - y)
close all;

figure(10)
title('Dane weryfikujące');
hold on;
fig=gcf;
fig.Position(3:4)=[800,400];
plot(y)
plot(y_mod)
legend('proces', 'model')
xlabel('k')
ylabel('y')
print (['model_werarx.png' ], '-dpng', '-r400')

figure(11)
title('Dane uczące');
hold on;
fig=gcf;
fig.Position(3:4)=[800,400];
plot(y_ucz)
plot(y_mod_ucz)
legend('proces', 'model')
xlabel('k')
ylabel('y')
print (['model_uczarx.png' ], '-dpng', '-r400')
% close all;

%% Model liniowy 
close all

load dane_wer_2.mat
load dane_ucz_2.mat
u_wer = dane_wer(:, 2);
y_wer = dane_wer(:, 1);
u = dane_ucz(:, 2);
y = dane_ucz(:, 1);

kmin=7; kmax=2000;
 
%wektory u i y muszą być pionowe!
M = [u(kmin-5:kmax-5) u(kmin-6:kmax-6) y(kmin-1:kmax-1) y(kmin-2:kmax-2)];
w = M\y(kmin:kmax);
b5=w(1); b6=w(2); a1=-w(3); a2=-w(4);
 
y_mod_arx(1:kmin-1)=y(1:kmin-1);
y_mod_oe(1:kmin-1)=y(1:kmin-1);
for k=kmin:kmax
    y_mod_arx(k)=b5*u(k-5)+b6*u(k-6)-a1*y(k-1)-a2*y(k-2);%ARX
    y_mod_oe(k)=b5*u(k-5)+b6*u(k-6)-a1*y_mod_oe(k-1)-a2*y_mod_oe(k-2);%OE
end

figure
title('ARX UCZ')
hold on 
plot(y)
plot(y_mod_arx)

figure
title('OE UCZ')
hold on 
plot(y)
plot(y_mod_oe)

y_mod_arx(1:kmin-1)=y_wer(1:kmin-1);
y_mod_oe(1:kmin-1)=y_wer(1:kmin-1);
for k=kmin:kmax
    y_mod_arx(k)=b5*u_wer(k-5)+b6*u_wer(k-6)-a1*y_wer(k-1)-a2*y_wer(k-2);%ARX
    y_mod_oe(k)=b5*u_wer(k-5)+b6*u_wer(k-6)-a1*y_mod_oe(k-1)-a2*y_mod_oe(k-2);%OE
end

figure
title('ARX WER')
hold on 
plot(y_wer)
plot(y_mod_arx)

figure
title('OE WER')
hold on 
plot(y_wer)
plot(y_mod_oe)




