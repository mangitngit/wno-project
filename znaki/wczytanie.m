featureout44 = zeros(396,108);

for n=1:396
imagen=imread(sprintf('%d.jpg',n));

%% pokazanie obrazka
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')

%% skala szaroœci
if size(imagen,3)==3 % if RGB image
    imagen=rgb2gray(imagen); % zmiana na szare
end
threshold = graythresh(imagen); % wyostrzanie krawêdzi
imagen = ~im2bw(imagen,threshold);  % konwersja na binarny

%% usuwanie zak³óceñ
imagen = bwareaopen(imagen,20);

%% wykrycie krawedzi
Iedge = edge(uint8(imagen),'Roberts');

%% wype³nienie krawêdzi
se = strel('square',3);
Iedge2 = imdilate(Iedge, se); 
Ifill = imfill(Iedge2,'holes');

Ifill = Ifill & imagen;
    
z=Ifill;
BW2 = bwmorph(z,'thin',Inf);

z=feature_extract(z);   
    featureout44(n,:)=z';
    
 end

%%

save('featureout6.mat','featureout44');
featureout44;