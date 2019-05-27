wzor = 'COŒSIÊKOÑCZYCOŒSIÊZACZYNA';
wzor2 = 'LEPIEJBEZCELUIŒÆNAPRZÓDNI¯BEZCELUSTAÆWMIEJSCUAZPEWNOŒCI¥ONIEBOLEPIEJNI¯BEZCELUSIÊCOFAÆ';
wzor3 = 'ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯ABCDEFGHIJKLMNOPRSTUVWYZ¥ÊÆ£ÑÓŒ¯';
wzor4 = 'ARTIFICIALNEURALNETWORK';

%% otworzenie pliku
plik = fopen('output.txt');
odczyt=fscanf(plik,'%s');
fclose(plik);

%% zliczanie poprawnych liter
i = 0;
if length(odczyt) < 24
    for n=1:length(odczyt)
        if wzor4(n)==odczyt(n)
            i = i + 1;
        end
    end
    poprawnosc = 100*i/23;
elseif length(odczyt) < 26
    for n=1:length(odczyt)
        if wzor(n)==odczyt(n)
            i = i + 1;
        end
    end
    poprawnosc = 100*i/25;
elseif length(odczyt) < 87
    for n=1:length(odczyt)
        if wzor2(n)==odczyt(n)
            i = i + 1;
        end
    end
    poprawnosc = 100*i/86;
else
    for n=1:length(odczyt)
        if wzor3(n)==odczyt(n)
            i = i + 1;
        end
    end
    poprawnosc = 100*i/396;
end

%% wypisanie poprawnoœci odczytu
X = ['   Poprawnoœæ tekstu w ',num2str(poprawnosc),'%'];
disp(X)