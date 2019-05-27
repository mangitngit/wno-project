close all;
clear all;
clc;

fid = fopen('output.txt','w');
fprintf(fid,'');
fclose(fid);

%%
trenowanie;

obraz = imread('obrazy/Scan3.png');
obraz2 = obraz;



%% przygotowanie obrazu
if size(obraz,3)==3
    obraz=rgb2gray(obraz); % zmiana na szare
end
threshold = graythresh(obraz); % czarno-bia³y
obraz = ~im2bw(obraz,threshold);  % konwersja na binarny

obraz = bwareaopen(obraz,20); % usuwanie zak³óceñ w postaci osobnych pikseli

krawedz = edge(uint8(obraz),'Roberts');
se = strel('square',3);
krawedz2 = imdilate(krawedz, se); % rozszerzanie

wypelnienie = imfill(krawedz2,'holes');
wypelnienie = wypelnienie & obraz;

obrobka=wypelnienie;

figure(1)
imshow(obrobka);

figure(3)
imshow(obraz2);
title('Obraz bazowy')

%% zaznaczenie wykrytych liter
[Le, num] = bwlabel(wypelnienie);
propied = regionprops(Le,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off
pause (1)

%%
while 1 %% wyciecie lini
    [biezaca_linia, obrobka] = lines(obrobka);
    linia_tekstu = biezaca_linia; 
    [L, num] = bwlabel(linia_tekstu);
    
%% wydzielanie poszczególnych liter
    for n=1:num
        [r, c] = find(L==n);
        literka = linia_tekstu(min(r):max(r),min(c):max(c));
        
        if n>1
            [rr, cc] = find(L==n-1);
            if min(c)-max(cc)>30
                fid = fopen('output.txt','a');
                fprintf(fid,' ');
                fclose(fid);
            end
        end
        
        bw = bwmorph(literka,'thin',Inf); % 'odchudzanie'
        sprawdzana = imresize(bw,[50 50]);     
        sprawdzana = wydobycie_cech(sprawdzana);
        
        load ('cechy.mat');
        cechy = sprawdzana;
        save ('cechy.mat','cechy');
        
        testowanie;
    end

    if isempty(obrobka)
        break
    end
    fid = fopen('output.txt','a');
    fprintf(fid,'\r\n');
    fclose(fid);
end

zgodnosc;

winopen('output.txt');
close (gcbf);