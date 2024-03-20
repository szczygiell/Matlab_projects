fileID = fopen('dane.txt','w');
% petla
for i=1:2001
    fprintf( fileID, '%d %d\n', dane_ucz(i, 2), dane_ucz(i, 1));
end
fclose(fileID);