clear all;

x=0:0.1:10;
for n=1:length(x)
    y(n)=3*exp(-x(n)*0.5)*sin(2*x(n))+3*exp(-x(n)*0.25)*cos(2*x(n))+0.035*x(n)^2+0.0001*x(n)^4;
end

figure;
plot(x,y,'.b','markersize',14);
title('Dane ucz¹ce');
% x_ucz=x; y_ucz=y; 
% save dane_ucz x_ucz y_ucz

x=0:0.07:10;
for n=1:length(x)
    y(n)=3*exp(-x(n)*0.5)*sin(2*x(n))+3*exp(-x(n)*0.25)*cos(2*x(n))+0.035*x(n)^2+0.0001*x(n)^4;
end

figure;
plot(x,y,'.r','markersize',14);
title('Dane weryfikuj¹ce');
% x_wer=x; y_wer=y; 
% save dane_wer x_wer y_wer