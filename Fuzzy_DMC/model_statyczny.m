function model_statyczny()
FD(1:10000) = 13;
h2 = zeros(1, 10000); 
h1 = zeros(1, 10000); 
us = [];
ys = [];
u(1:80) = 0;
for i=0:150
    u(80:10000) = i;
    for k=81:10000
        [h1(k), h2(k)] = symulacja(h1(k-1), h2(k-1), u(k-80),FD(k-1), 0.1);

    end
    us = [us, i];
    ys = [ys, h2(10000)];
end
hold on
ylabel('h2')
xlabel('u')
plot(us, ys)


