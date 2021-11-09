%% Jakub Zbrzezny

% 2. Oddzia�ywania elektrostatyczne
% Temat 2.2. Obliczanie nat�enia pola elektrostatycznego lub potencja�u wok� figur (kwadraty, prostok�ty, tr�jk�ty, itp.) metod� superpozycji.

% I) Wprowadzenie:

% Zasada superpozycji p�l elektrostatycznych jest narz�dziem umo�liwiaj�cym znajdowanie wypadkowego nat�enia oraz potencja�u pola elektrostatycznego w przypadku, 
% gdy jest ono wytworzone przez uk�ad n �adunk�w punktowych.

% Zasada ta polega na wektorowym dodawaniu wszystkich p�l elektrostatycznych, pochodz�cych od wszystkich �adunk�w puntkowych znajduj�cych si� w danym uk�adzie.

% Nat�enie pola elektrostatycznego wytwarzanego przez i-ty �adunek w punkcie [x y] wynosi:
% E_i = ((k * q_i) / (r_i^2)) * [(x - x_i) (y - y_i)],
% gdzie:
% [x_i y_i] - wsp�rz�dne i-tego �adunku
% q_i - warto�� �adunku;
% r_i - odleg�o�� od pola elektrostatycznego.
% k = 1 / (4 pi * eps_0) = 8.987 * 10^9 [N * m^2 / C^2];
% eps_0 - przenikalno�� elektryczna pr�ni;

% Nat�enie jest wielko�ci� wektorow�.

% Wypadkowe nat�enie wynosi:
% E_w = \sum_{i = 1}^n E_i.

% Potencja� pola elektrostatycznego wytwarzanego przez i-ty �adunek w punkcie [x y] wynosi:
% V_i = (k * q_i) / r_i.

% Potencja� jest wielko�ci� skalarn�.

% Wypadkowy potencja� wynosi:
% V_w = \sum_{i = 1}^n V_i.

% B�dziemy obrazowa� nat�enie pola elektrostatycznego za pomoc� rysowanych strza�ek. W zale�no�ci od wielko�ci nat�enia pola, strza�ki b�d� odpowiednio skalowane. 
% B�dziemy wykre�la� strza�ki za pomoc� zdefiniowanej poni�szej funkcji:
% drawArrow = @(x, y, c) quiver(x(1), y(1), x(2)-x(1), y(2)-y(1), c).    
% W pierwszym argumencie podajemy dwuwymiarowy wektor x = [x(1) x(2)], gdzie x(1) jest 1-sz� wsp�rz�dn� punktu pocz�tkowego, a x(2) jest 1-sz� wsp�rz�dn� punktu ko�cowego, 
% natomiast w drugim podajemy dwuwymiarowy wektor y = [y(1) y(2)], gdzie, analogicznie, y(1) jest 2-g� wsp�rz�dn� punktu pocz�tkowego, a y(2) jest 2-g� wsp�rz�dn� 
% punktu ko�cowego. Natomiast w trzecim argumencie podajemy kolor wykre�lanej strza�ki. B�dzie to istotne, gdy� b�dziemy chcieli zaznaczy�, dla jakiego �adunki jest wektor 
% nat�enia pola.

% 1-szy, 2-gi argument funkcji quiver okre�laj�, odpowiednio, wsp�rz�dne pocz�tku wykre�lanej strza�ki.
% 3-ci, 4-ty argument, okre�laj� wektor przemieszczenia strza�ki.
% 5-ty argument, okre�la kolor rysowanej strza�ki.

% Szczeg�y o funkcji quiver() s� zawarte na nast�puj�cej stronie:
% https://www.mathworks.com/help/matlab/ref/quiver.html

%% Przyk�ady u�ycia funkcji drawArrow

x1 = [10 30];
y1 = [10 30];

drawArrow = @(x, y, c) quiver(x(1), y(1), x(2)-x(1), y(2)-y(1), c);
drawArrow(x1, y1, 'r'); hold on;

x2 = [25 15];
y2 = [15 25];

drawArrow(x2, y2, 'b'); hold on;
% hold on powoduje, �e od tego momentu nowe obiekty b�d� dodawane do okna bez usuwania istniej�cych obiekt�w.
% hold off powoduje, �e od tego momentu przed dodaniem jakiegokolwiek nowego obiektu okno graficzne b�dzie czyszczone.
 
x3 = [15 20];
y3 = [35 15];
drawArrow(x3, y3, 'g'); hold on;
title('Przyk�ady u�ycia funkcji drawArrow');
legend(['x1 = [' num2str(x1(1)) ' ' num2str(x1(2)) '], ' 'y1 = [' num2str(y1(1)) ' ' num2str(y1(2)) ']'], ...
       ['x2 = [' num2str(x2(1)) ' ' num2str(x2(2)) '], ' 'y2 = [' num2str(y2(1)) ' ' num2str(y2(2)) ']'], ...
       ['x3 = [' num2str(x3(1)) ' ' num2str(x3(2)) '], ' 'y3 = [' num2str(y3(1)) ' ' num2str(y3(2)) ']']);
hold off;


% II) Symulacje

% 1. Kwadraty

%% a) Kwadrat o d�ugo�ci boku r�wnym 1 
% Wszystkie �adunki o jednakowych warto�ciach q = 1C 
% Liczymy wypadkowe nat�enie i wypadkowy potencja� pola elektrostatycznego w �rodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, 1, 1, [0.5 0.5]);

% Wektora nat�enia wypadkowego nie wida� na wykresie, poniewa� jest r�wny wektorowi zerowemu.

%% b) Kwadrat o d�ugo�ci boku r�wnym 1
% q_1 = 1C, q_2 = 1C, q_3 = -1C, q_4 = -1C
% Liczymy wypadkowe nat�enie i wypadkowy potencja� pola elektrostatycznego w �rodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, -1, -1, [0.5 0.5]);

%% c) Kwadrat o d�ugo�ci boku r�wnym 1
% q_1 = 1C, q_2 = 1C, q_3 = 2C, q_4 = 2C
% Liczymy wypadkowe nat�enie i wypadkowy potencja� pola elektrostatycznego w �rodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, 2, 2, [0.5 0.5]);

%% d) Kwadrat o d�ugo�ci boku r�wnym 1
% q_1 = 1C, q_2 = 2C, q_3 = -1,5C, q_4 = -1,5C
% q_1 + q_2 + q_3 + q_4 = 0C
% Rozwa�any punkt: �rodek kwadratu

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 2, -1.5, -1.5, [0.5 0.5]);

% 2. Prostok�ty

%% a) D�ugo�ci bok�w: 2, 1
% Odpowiadaj�ce �adunki: 1C, 1C, 1C, 1C
% Rozwa�any punkt: �rodek prostok�ta, czyli [1 1/2]

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, 1, 1, 1, [1 1/2]);

%% b) D�ugo�ci bok�w: 2, 1
% Odpowiadaj�ce �adunki: 1C, -1C, 1C, 1C
% Rozwa�any punkt: �rodek prostok�ta

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, -1, 1, 1, [1 1/2]);

%% c) D�ugo�ci bok�w: 2, 1
% q_1 = 1C, q_2 = -1C, q_3 = -2C, q_4 = 2C
% q_1 + q_2 + q_3 + q_4 = 0C
% Rozwa�any punkt: �rodek prostok�ta

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, -1, -2, 2, [1 1/2]);

% 3. Tr�jk�ty
%% a) Tr�jk�t r�wnoramienny o wierzcho�kach: [0 0], [2 0], [1 1]
% Odpowiadaj�ce �adunki: 1C, 1C, 1C
% Rozwa�any punkt: �rodek tr�jk�ta

p_1 = [0 0];
p_2 = [2 0];
p_3 = [1 1];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];
    
Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 1, 1, 1, p_w);

%% b) Tr�jk�t r�wnoboczny o d�ugo�ci boku r�wnym 1
% Odpowiadaj�cy �adunki: 1C, 1C, 1C
% Rozwa�any punkt: �rodek tr�jk�ta

p_1 = [0 0];
p_2 = [1 0];
p_3 = [1/2 (1 * sqrt(3)/2)];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];

Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 1, 1, 1, p_w);

%% c) Tr�jk�t r�wnoboczny o d�ugo�ci boku r�wnym 1
% q_1 = 2C, q_2 = -1C, q_3 = -1C
% q_1 + q_2 + q_3 = 0C
% Rozwa�any punkt: �rodek tr�jk�ta

p_1 = [0 0];
p_2 = [1 0];
p_3 = [1/2 (1 * sqrt(3)/2)];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];

Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 2, -1, -1, p_w);

% 4. Pi�ciok�ty
%% a) Pi�ciok�t foremny o d�ugo�ciach bok�w r�wnych 1
% q_1 = q_2 = q_3 = q_4 = q_5 = 1C

% Suma k�t�w w pi�ciok�cie wynosi 540 stopni.

p_1 = [0 0];
p_2 = [1 0];
p_3 = [(1 + cos(2 * pi / 5)) sin(2 * pi / 5)];
p_4 = [(p_3(1) - cos(2 * pi * (36 / 360))) (p_3(2) + sin(2 * pi * (36 / 360)))];
p_5 = [(0 - cos(2 * pi / 5)) sin(2 * pi / 5)];

p_w = [mean([p_1(1) p_2(1) p_3(1) p_4(1) p_5(1)]) mean([p_1(2) p_2(2) p_3(2) p_4(2) p_5(2)])];
        
Natezenie_potencjal_5_punktow(p_1, p_2, p_3, p_4, p_5, 1, 1, 1, 1, 1, p_w);

%% b) Przyk�ad analogiczny
% Jedyna r�nica: q_1 = q_2 = -1C

p_1 = [0 0];
p_2 = [1 0];
p_3 = [(1 + cos(2 * pi / 5)) sin(2 * pi / 5)];
p_4 = [(p_3(1) - cos(2 * pi * (36 / 360))) (p_3(2) + sin(2 * pi * (36 / 360)))];
p_5 = [(0 - cos(2 * pi / 5)) sin(2 * pi / 5)];

p_w = [mean([p_1(1) p_2(1) p_3(1) p_4(1) p_5(1)]) mean([p_1(2) p_2(2) p_3(2) p_4(2) p_5(2)])];
        
Natezenie_potencjal_5_punktow(p_1, p_2, p_3, p_4, p_5, -1, 1, 1, -1, 2, p_w);

%% c) Pi�ciok�t foremny o d�ugo�ci boku r�wnym 1
% q_1 = 1C, q_2 = 2C, q_3 = 2C, q_4 = -3C, q_5 = -2C
% q_1 + q_2 + q_3 + q_4 + q_5 = 0C

p_1 = [0 0];
p_2 = [1 0];
p_3 = [(1 + cos(2 * pi / 5)) sin(2 * pi / 5)];
p_4 = [(p_3(1) - cos(2 * pi * (36 / 360))) (p_3(2) + sin(2 * pi * (36 / 360)))];
p_5 = [(0 - cos(2 * pi / 5)) sin(2 * pi / 5)];

p_w = [mean([p_1(1) p_2(1) p_3(1) p_4(1) p_5(1)]) mean([p_1(2) p_2(2) p_3(2) p_4(2) p_5(2)])];
 
Natezenie_potencjal_5_punktow(p_1, p_2, p_3, p_4, p_5, 1, 2, 2, -3, -2, p_w);

% Wnioski:
% 1. Je�eli na ka�dym wierzcho�ku wielok�ta foremnego, �adunki punktowe maj� tak� sam� warto��, to w �rodku figury wypadkowy wektor nat�enia pola elektrostatycznego 
% jest r�wny wektorowi zerowemu, ale w przypadku �adunk�w o niezerowej warto�ci, wypadkowy potencja� pola jest niezerowy.
% 2. W przypadku, gdy liczba wierzcho�k�w wielok�ta jest parzysta oraz wszystkie przek�tne przechodz� przez �rodek figury, to w przypadku d�ugo�ci bok�w wielok�ta, 
% wystarczy tylko, by jego naprzeciwleg�e  wzgl�dem siebie boki, mia�y tak� sam� d�ugo��.
% 3. Je�li w figurze o parzystej liczbie bok�w, ka�da para �adunk�w punktowych znajduj�ca si� na tej samej przek�tnej danej figury, ma przeciwne znaki, i ma takie 
% same warto�ci bezwzgl�dne, to w �rodku figury, wypadkowy potencja� jest r�wny 0, ale w przypadku niezerowych �adunk�w, wektor nat�enia pola jest niezerowy.
% 4. W dowolnym wielok�cie foremnym, suma warto�ci wszystkich �adunk�w punktowych jest r�wna 0, to w �rodku figury, wypadkowy potencja� pola elektrostatycznego, jest r�wny 0, 
% ale wypadkowy wektor nat�enia pola, nie musi by� r�wny wektorowi zerowemu.
% 5. Je�li w wielok�cie, odleg�o�� ka�dego wierzcho�ka od �rodka jest jednakowa (np. prostok�t), to teza jest taka sama jak w poprzednim wniosku.