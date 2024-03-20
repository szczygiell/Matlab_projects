function [h1, h2] = symulacja(h1_1, h2_1, F1in_80, FD_1, T)
    A2=430; C1 = 0.85; alfa1 = 19; alfa2 = 23; 
    % T = 0.1;
    V1_1 = C1*h1_1^2;
    V2_1 = A2*h2_1;
    F3_1 = abs(alfa2*sqrt(h2_1));
    F2_1 = abs(alfa1*sqrt(h1_1));
    F1_1 = F1in_80;
    V1 = T*(F1_1 + FD_1 - F2_1) + V1_1;
    V2 = T*(F2_1 - F3_1) + V2_1;
    h1 = abs(sqrt(V1/C1));
    h2 = V2/A2;
end
