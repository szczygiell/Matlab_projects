% mf = [fismf("trapmf",[0 0 15 35],'Name',"low");
%       fismf("trapmf",[15 35 50 50],'Name',"high")];

% mf = [fismf("trapmf",[0 0 10 20],'Name',"low");
%       fismf("trapmf",[10 20 30 40],'Name',"medium");
%       fismf("trapmf",[30 40 50 50],'Name',"high")];
% 
% mf = [fismf("trapmf",[0 0 8 14],'Name',"low");
%       fismf("trapmf",[8 14 22 28],'Name',"med_low");
%       fismf("trapmf",[22 28 36 42],'Name',"med_high");
%       fismf("trapmf",[36 42 50 50],'Name',"high")];
% 
% mf = [fismf("trapmf",[0 0 6 11],'Name',"low");
%       fismf("trapmf",[6 11 17 22],'Name',"med_low");
%       fismf("trapmf",[17 22 28 33],'Name',"medium");
%       fismf("trapmf",[28 33 39 44],'Name',"med_high");
%       fismf("trapmf",[39 44 50 50],'Name',"high")];


% mf = [fismf("pimf",[0 0 15 35],'Name',"low");
%       fismf("pimf",[15 35 50 50],'Name',"high")];
% 
% mf = [fismf("pimf",[0 0 0 25],'Name',"low");
%       fismf("pimf",[0 25 25 50],'Name',"medium");
%       fismf("pimf",[25 50 50 100],'Name',"high")];

% mf = [fismf("pimf",[0 0 0 16],'Name',"low");
%       fismf("pimf",[0 16 16 34],'Name',"med_low");
%       fismf("pimf",[16 34 34 50],'Name',"med_high");
%       fismf("pimf",[34 50 50 100],'Name',"high")];

mf = [fismf("pimf",[0 0 0 6],'Name',"low");
      fismf("pimf",[0 6 6 15],'Name',"med_low");
      fismf("pimf",[6 15 15 25],'Name',"medium");
      fismf("pimf",[15 25 25 50],'Name',"med_high");
      fismf("pimf",[25 50 50 100],'Name',"high")];



figure 
x = 0:50;
y = evalmf(mf,x);
plot(x,y)
xlabel('Input (x)')
ylabel('Membership value (y)')
legend("low","high")


%% sekcja
% close all;
% clear all;
pp1 = [46 137];
pp2 = [39 102 143];
pp3 = [30 83 118 145];
pp4 = [27 74 103 126 147];

pp1g = [60 135];
pp2g = [39 103 148];
pp3g = [39 78 120 148];
pp4g = [39 63 78 126 148];
pp6g = [20 43 76 102 145];

F1_pp = 52;
skok = 80;
kind = 1;
amount = 2;
pc = pp1;
[h1, h2] = model_od_pp(skok);
[h12, h22] = model_liniowy_od_pp(skok, 102);
% [h16, h26] = model_rozmyty(skok, 1, 5, pp6g);
% [h17, h27] = model_rozmyty(skok, 2, 5, pp4g);

hold on;
plot(h2(1:1000))
plot(h22)
plot(h26)
plot(h27)

% [h13, h23] = model_rozmyty(skok, 1, 2, pp1);
% [h14, h24] = model_rozmyty(skok, 1, 3, pp2);
% [h15, h25] = model_rozmyty(skok, 1, 4, pp3);
% [h16, h26] = model_rozmyty(skok, 1, 5, pp4);

% [h13, h23] = model_rozmyty(skok, 2, 2, pp1g);
% [h14, h24] = model_rozmyty(skok, 2, 3, pp2g);
% [h15, h25] = model_rozmyty(skok, 2, 4, pp3g);
% [h16, h26] = model_rozmyty(skok, 2, 5, pp4g);





% plot(h23)
% plot(h24)
% plot(h25)

xlabel('k')
ylabel('h2')
legend('model nieliniowy', 'model zlinearyzowany','5 modeli lokalnych poprawiony', '5  modeli lokalnych', 'Location','southeast')




