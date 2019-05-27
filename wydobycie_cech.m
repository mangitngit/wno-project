function [cechy] = wydobycie_cech(obraz)

wiersz = size(obraz,1);
kolumna = size(obraz,2);

%% dodawanie kolumn i wierszy, jeœli obrazek mniejszy ni¿ 9x9
dodaj_wiersz = 0;
dodaj_kolumne = 0;
if wiersz<9
    dodaj_wiersz = 9-wiersz;
end
if kolumna<9
    dodaj_kolumne = 9-kolumna;
end

if mod(dodaj_wiersz,2)==0
    obraz = [zeros(dodaj_wiersz/2,kolumna);obraz;zeros(dodaj_wiersz/2,kolumna)];
else
    obraz = [zeros((dodaj_wiersz-1)/2,kolumna);obraz;zeros((dodaj_wiersz+1)/2,kolumna)];
end
wiersz = size(obraz,1);

if mod(dodaj_kolumne,2)==0
    obraz = [zeros(wiersz,(dodaj_kolumne)/2),obraz,zeros(wiersz,(dodaj_kolumne)/2)];
else
    obraz = [zeros(wiersz,(dodaj_kolumne-1)/2),obraz,zeros(wiersz,(dodaj_kolumne+1)/2)];
end
kolumna = size(obraz,2);

%% dodawanie kolumn i wierszy, jeœli rozmiary obrazka nie s¹ podzielne przez 3
n_wiersz = ceil(wiersz/3)*3-wiersz;
n_kolumna = ceil(kolumna/3)*3-kolumna;

if mod(n_wiersz,2)==0
    obraz = [zeros(n_wiersz/2,kolumna);obraz;zeros(n_wiersz/2,kolumna)];
else
    obraz = [zeros((n_wiersz-1)/2,kolumna);obraz;zeros((n_wiersz+1)/2,kolumna)];
end
wiersz = size(obraz,1);

if mod(n_kolumna,2)==0
    obraz = [zeros(wiersz,(n_kolumna)/2),obraz,zeros(wiersz,(n_kolumna)/2)];
else
    obraz = [zeros(wiersz,(n_kolumna-1)/2),obraz,zeros(wiersz,(n_kolumna+1)/2)];
end
kolumna = size(obraz,2);

%% podzia³ obrazka na 9 czêœci
szerokosc = wiersz/3;
wysokosc = kolumna/3;

obszar11 = obraz(1:szerokosc,1:wysokosc);
obszar12 = obraz(1:szerokosc,(wysokosc+1):2*wysokosc);
obszar13 = obraz(1:szerokosc,(2*wysokosc+1):end);

obszar21 = obraz((szerokosc+1):2*szerokosc,1:wysokosc);
obszar22 = obraz((szerokosc+1):2*szerokosc,(wysokosc+1):2*wysokosc);
obszar23 = obraz((szerokosc+1):2*szerokosc,(2*wysokosc+1):end);

obszar31 = obraz((2*szerokosc+1):end,1:wysokosc);
obszar32 = obraz((2*szerokosc+1):end,(wysokosc+1):2*wysokosc);
obszar33 = obraz((2*szerokosc+1):end,(2*wysokosc+1):end);

%% przypisanie
obszar11_cechy = gradient(obszar11);
obszar12_cechy = gradient(obszar12);
obszar13_cechy = gradient(obszar13);

obszar21_cechy = gradient(obszar21);
obszar22_cechy = gradient(obszar22);
obszar23_cechy = gradient(obszar23);

obszar31_cechy = gradient(obszar31);
obszar32_cechy = gradient(obszar32);
obszar33_cechy = gradient(obszar33);

%% zwrócenie wartoœci
cechy = [obszar11_cechy; obszar12_cechy; obszar13_cechy;
         obszar21_cechy; obszar22_cechy; obszar23_cechy;
         obszar31_cechy; obszar32_cechy; obszar33_cechy];
