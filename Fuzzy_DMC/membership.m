function [w] = membership(y, kind, amount_of_sets)

if kind == 1 %trapezowe
    if amount_of_sets == 2
        
      % mf = [fismf("trapmf",[0 0 15 20],'Name',"low");
      % fismf("trapmf",[14 20 100 100],'Name',"high")];
      mf = [fismf("trapmf",[0 0 15 35],'Name',"low");
      fismf("trapmf",[15 35 50 50],'Name',"high")];

    
    elseif amount_of_sets == 3

      % mf = [fismf("trapmf",[0 0 10 20],'Name',"low");
      % fismf("trapmf",[10 20 30 40],'Name',"medium");
      % fismf("trapmf",[30 40 100 100],'Name',"high")];
      mf = [fismf("trapmf",[0 0 10 20],'Name',"low");
      fismf("trapmf",[10 20 30 40],'Name',"medium");
      fismf("trapmf",[30 40 50 50],'Name',"high")];


    
    elseif amount_of_sets == 4

      mf = [fismf("trapmf",[0 0 8 14],'Name',"low");
      fismf("trapmf",[8 14 22 28],'Name',"med_low");
      fismf("trapmf",[22 28 36 42],'Name',"med_high");
      fismf("trapmf",[36 42 50 50],'Name',"high")];

    
%     elseif amount_of_sets == 5
% 
%       mf = [fismf("trapmf",[0 0 6 11],'Name',"low");
%       fismf("trapmf",[6 11 17 22],'Name',"med_low");
%       fismf("trapmf",[17 22 28 33],'Name',"medium");
%       fismf("trapmf",[28 33 39 44],'Name',"med_high");
%       fismf("trapmf",[39 44 50 50],'Name',"high")];

        elseif amount_of_sets == 5

          mf = [fismf("pimf",[0 0 0 6],'Name',"low");
      fismf("pimf",[0 6 6 15],'Name',"med_low");
      fismf("pimf",[6 15 15 25],'Name',"medium");
      fismf("pimf",[15 25 25 50],'Name',"med_high");
      fismf("pimf",[25 50 50 100],'Name',"high")];  
        
    end
    
    w = evalmf(mf, y);

end

if kind == 2 %gauss
    if amount_of_sets == 2

      mf = [fismf("pimf",[0 0 15 35],'Name',"low");
      fismf("pimf",[15 35 50 50],'Name',"high")];


    elseif amount_of_sets == 3

      mf = [fismf("pimf",[0 0 0 25],'Name',"low");
      fismf("pimf",[0 25 25 50],'Name',"medium");
      fismf("pimf",[25 50 50 100],'Name',"high")];


    
    elseif amount_of_sets == 4

      mf = [fismf("pimf",[0 0 0 16],'Name',"low");
      fismf("pimf",[0 16 16 34],'Name',"med_low");
      fismf("pimf",[16 34 34 50],'Name',"med_high");
      fismf("pimf",[34 50 50 100],'Name',"high")];

    
    elseif amount_of_sets == 5

      mf = [fismf("pimf",[0 0 0 11],'Name',"low");
      fismf("pimf",[0 11 11 25],'Name',"med_low");
      fismf("pimf",[11 25 25 37],'Name',"medium");
      fismf("pimf",[25 37 37 50],'Name',"med_high");
      fismf("pimf",[37 50 50 100],'Name',"high")];

    

%     elseif amount_of_sets == 5
% 
%       mf = [fismf("pimf",[0 0 0 6],'Name',"low");
%       fismf("pimf",[0 6 6 15],'Name',"med_low");
%       fismf("pimf",[6 15 15 25],'Name',"medium");
%       fismf("pimf",[15 25 25 50],'Name',"med_high");
%       fismf("pimf",[25 50 50 100],'Name',"high")];

    end
    
    
    w = evalmf(mf, y);

end

% if kind == 3 %może jeszcze jakiś
% 
% k= 0;
% 
% end

end