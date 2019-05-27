load ('cechy.mat');
load ('net.mat');

%% symulacja sieci dla cechy
y = sim(net,cechy);
[C, I] = max(y);

%% wypisanie do pliku odpowiednich literaer w zaleønoúci od wyniku symulacji
fid = fopen('output.txt','a');

if (I==1)
    litera = 'A';
    fprintf(fid,'A');
fclose(fid);
elseif (I==2)
    litera = 'B';
    fprintf(fid,'B');
fclose(fid);     
elseif (I==3)
    litera = 'C';
    fprintf(fid,'C');
fclose(fid);     
elseif (I==4)
    litera = 'D';
    fprintf(fid,'D');
fclose(fid);     
elseif (I==5)
    litera = 'E';
    fprintf(fid,'E');
fclose(fid);     
elseif (I==6)
    litera = 'F';
    fprintf(fid,'F');
fclose(fid);     
elseif (I==7)
    litera = 'G';
    fprintf(fid,'G');
fclose(fid);     
elseif (I==8)
    litera = 'H';
    fprintf(fid,'H');
fclose(fid);     
elseif (I==9)
    litera = 'I';
    fprintf(fid,'I');
fclose(fid);     
elseif (I==10)
    litera = 'J';
    fprintf(fid,'J');
fclose(fid);     
elseif (I==11)
    litera = 'K';
    fprintf(fid,'K');
fclose(fid);     
elseif (I==12)
    litera = 'L';
    fprintf(fid,'L');
fclose(fid);     
elseif (I==13)
    litera = 'M';
    fprintf(fid,'M');
fclose(fid);     
elseif (I==14)
    litera = 'N';
    fprintf(fid,'N');
fclose(fid);     
elseif (I==15)
    litera = 'O';
    fprintf(fid,'O');
fclose(fid);     
elseif (I==16)
    litera = 'P';
    fprintf(fid,'P');
fclose(fid);     
elseif (I==17)
    litera = 'R';
    fprintf(fid,'R');
fclose(fid);     
elseif (I==18)
    litera = 'S';
    fprintf(fid,'S');
fclose(fid);     
elseif (I==19)
    litera = 'T';
    fprintf(fid,'T');
fclose(fid);     
elseif (I==20)
    litera = 'U';
    fprintf(fid,'U');
fclose(fid);     
elseif (I==21)
    litera = 'V';
    fprintf(fid,'V');
fclose(fid);     
elseif (I==22)
    litera = 'W';
    fprintf(fid,'W');
fclose(fid);     
elseif (I==23)
    litera = 'Y';
    fprintf(fid,'Y');
fclose(fid);     
elseif (I==24)
    litera = 'Z';
    fprintf(fid,'Z');
fclose(fid);
elseif (I==25)
    litera = '•';
    fprintf(fid,'•');
fclose(fid);     
elseif (I==26)
    litera = ' ';
    fprintf(fid,' ');
fclose(fid);
elseif (I==27)
    litera = '∆';
    fprintf(fid,'∆');
fclose(fid);
elseif (I==28)
    litera = '£';
    fprintf(fid,'£');
fclose(fid);
elseif (I==29)
    litera = '—';
    fprintf(fid,'—');
fclose(fid);
elseif (I==30)
    litera = '”';
    fprintf(fid,'”');
fclose(fid);
elseif (I==31)
    litera = 'å';
    fprintf(fid,'å');
fclose(fid);
elseif (I==32)
    litera = 'è';
    fprintf(fid,'è');
fclose(fid);
elseif (I==33)
    litera = 'Ø';
    fprintf(fid,'Ø');
fclose(fid);
else
    litera = '_';
    fprintf(fid,'_');
    fclose(fid);
end

%% wypisanie w konsoli
procent = C*100;

X = ['Znaleziono ',litera,' w ',num2str(procent),'% dok≥adnoúci'];
disp(X)
 