close all;
load dane_wer_2.mat
load dane_ucz_2.mat
X_ucz = dane_ucz(:, 2)';
Y_ucz = dane_ucz(:, 1)'; 
X_wer = dane_wer(:, 2)';
Y_wer = dane_wer(:, 1)'; 

rec = 1;
wer = 0;

% 
% % Definicja architektury sieci
% inputDelays = 5:6; % opóźnienia dla danych wejściowych
% feedbackDelays = 1:2; % opóźnienia dla danych wyjściowych
% hiddenLayerSize = 4; % liczba neuronów w warstwie ukrytej
% 
% % Tworzenie modelu NARX
% net = narxnet(inputDelays, feedbackDelays, hiddenLayerSize);
% 
% % Konfiguracja modelu (opcjonalne)
% net.trainFcn = 'trainlm'; % wybór algorytmu uczącego, np. 'trainlm' to Levenberg-Marquardt
% net.trainParam.epochs = 100; % liczba epok uczących
% net.trainParam.showWindow = false;
% 
% 
% % Przygotowanie danych w formie odpowiedniej dla narxnet
% [Xs,Xi,Ai,Ts] = preparets(net,con2seq(X_ucz),{},con2seq(Y_ucz));
% 
% % Trenowanie modelu
% 
% % 
% net = train(net,Xs,Ts,Xi,Ai);


% Symulacja modelu w trybie rekurencyjnym
if rec == 1
    net = closeloop(net); % Konwersja sieci na tryb bez rekurencji
end
if wer == 1
    [Xs, Xi, Ai, Ts] = preparets(net, con2seq(X_wer), {}, con2seq(Y_wer));

else
    [Xs,Xi,Ai,Ts] = preparets(net,con2seq(X_ucz),{},con2seq(Y_ucz));

end
Y_pred = sim(net, Xs, Xi, Ai);
outputs = cell2mat(Y_pred);


figure(1);
hold on;


xlabel('k')
ylabel('y')
legend('show');
fig=gcf;
fig.Position(3:4)=[800,400];
if wer == 1
    plot(Y_wer(7:end), 'b', 'DisplayName', 'Dane uczące');

plot(outputs, 'r--', 'DisplayName', 'Symulacja sieci');
    title('Dane weryfikujące i symulacja sieci');
    if rec == 1
        print("toolbox_wer_rec.png",'-dpng','-r400');
    else
        print("toolbox_wer_non_rec.png",'-dpng','-r400');
    end
else
    plot(Y_ucz(7:end), 'b', 'DisplayName', 'Dane uczące');

plot(outputs, 'r--', 'DisplayName', 'Symulacja sieci');
    title('Dane uczące i symulacja sieci');
    if rec == 1
        print("toolbox_ucz_rec.png",'-dpng','-r400');
    else
        print("toolbox_ucz_non_rec.png",'-dpng','-r400');
    end
end

hold off



