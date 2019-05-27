function [linia, reszta] = lines(obraz)
obraz = clip(obraz);
num = size(obraz,1);
for s=1:num
    if sum(obraz(s,:))==0
        nm = obraz(1:s-1, :);
        rm = obraz(s:end, :);
        linia = clip(nm);
        reszta = clip(rm);     
        break
    else
        linia = obraz;
        reszta = [ ];
    end
end

function obraz_out = clip(obraz_in)
[r, c] = find(obraz_in);
obraz_out = obraz_in(min(r):max(r),min(c):max(c));