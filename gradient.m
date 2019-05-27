function [wektor_cech] = gradient(obraz)

wiersz = size(obraz,1);
kolumna = size(obraz,2);

[Gmag, Gdir] = imgradient(obraz);

grad0 = 0;
grad1 = 0;
grad2 = 0;
grad3 = 0;
grad4 = 0;
grad5 = 0;
grad6 = 0;
grad7 = 0;
grad8 = 0;
grad9 = 0;
grad10 = 0;
grad11 = 0;

for r = 1:wiersz
    for c = 1:kolumna
        if Gdir(r,c) >= 0 && Gdir(r,c) < 30
           grad0 = grad0+1;
        elseif Gdir(r,c) >= 30 && Gdir(r,c) < 60
                grad1 = grad1+1;
        elseif Gdir(r,c) >= 60 && Gdir(r,c) < 90
                grad2 = grad2+1;
        elseif Gdir(r,c) >= 90 && Gdir(r,c) < 120
                grad3 = grad3+1;
        elseif Gdir(r,c) >= 120 && Gdir(r,c) < 150
                grad4 = grad4+1;
        elseif Gdir(r,c) >= 150 && Gdir(r,c) <180
                grad5 = grad5+1;
        elseif Gdir(r,c) >= -180 && Gdir(r,c) < -150
                grad6 = grad6+1;
        elseif Gdir(r,c) >= -150 && Gdir(r,c) < -120
                grad7 = grad7+1;
        elseif Gdir(r,c) >= -120 && Gdir(r,c) < -90
                grad8 = grad8+1;
        elseif Gdir(r,c) >= -90 && Gdir(r,c) < -60
                grad9 = grad9+1;
        elseif Gdir(r,c) >= -60 && Gdir(r,c) < -30
                grad10 = grad10+1;
        elseif Gdir(r,c) >= -30 && Gdir(r,c) < 0
                grad11 = grad11+1;
        end        
    end
end

wektor_cech=[grad0; grad1; grad2; grad3;
             grad4; grad5; grad6; grad7;
             grad8; grad9; grad10; grad11];