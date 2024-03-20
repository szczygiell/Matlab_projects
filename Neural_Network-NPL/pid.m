clear all;
close all;

K = 0.2; 
Ti = 8.5;
Td = 1.76; 
T = 1;
kmax = 500;

u = zeros(kmax, 1);
y = zeros(kmax, 1);
yzad = zeros(kmax, 1);
yzad(40:kmax) = 0.8;
yzad(150:kmax) = -4.5;
yzad(300:kmax) = -0.5;
yzad(400:kmax) = -2.5;


x1 = zeros(kmax, 1);
x2 = zeros(kmax, 1);


for k=7:kmax
    g1 = (exp(7.5*u(k-5))-1)/(exp(7.5*u(k-5))+1);
    x1(k) = 1.626651*x1(k-1) + x2(k-1) + 0.013274 * g1;
    x2(k) = -0.657673*x1(k-1) + 0.011544 * g1;
    g2 = 1.25*(1-exp(-2*x1(k)));
    y(k) = g2;

    e(k) = yzad(k) - y(k);

    u(k) = ((K*Td)/T)*e(k-2) + K*(T/(2*Ti)-(2*Td)/T-1)*e(k-1) + K*(1+T/(2*Ti)+Td/T)*e(k) + u(k-1);

    % Ograniczenia
    if u(k) > 1
        u(k) = 1;
    elseif u(k) < -1
        u(k) = -1;
    end

end


figure(1)
hold on;
fig=gcf;
fig.Position(3:4)=[800,400];


title('Regulator PID');


plot(yzad)
plot(y)

legend('yzad','y')
xlabel('k')
ylabel('y')
print ([sprintf('reg_pid%d_%d_%d.png', K, Td, Ti) ], '-dpng', '-r400')
hold off



figure(2)
fig=gcf;
fig.Position(3:4)=[800,400];
plot(u)
title('Sterowanie PID');

xlabel('k')
ylabel('y')
print ([sprintf('1ster_pid%d_%d_%d.png', K, Td, Ti) ], '-dpng', '-r400')

