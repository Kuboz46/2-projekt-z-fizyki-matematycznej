%% Jakub Zbrzezny

% 2. Oddzia³ywania elektrostatyczne
% Temat 2.2. Obliczanie natê¿enia pola elektrostatycznego lub potencja³u wokó³ figur (kwadraty, prostok¹ty, trójk¹ty, itp.) metod¹ superpozycji.

% I) Wprowadzenie:

% Zasada superpozycji pól elektrostatycznych jest narzêdziem umo¿liwiaj¹cym znajdowanie wypadkowego natê¿enia oraz potencja³u pola elektrostatycznego w przypadku, 
% gdy jest ono wytworzone przez uk³ad n ³adunków punktowych.

% Zasada ta polega na wektorowym dodawaniu wszystkich pól elektrostatycznych, pochodz¹cych od wszystkich ³adunków puntkowych znajduj¹cych siê w danym uk³adzie.

% Natê¿enie pola elektrostatycznego wytwarzanego przez i-ty ³adunek w punkcie [x y] wynosi:
% E_i = ((k * q_i) / (r_i^2)) * [(x - x_i) (y - y_i)],
% gdzie:
% [x_i y_i] - wspó³rzêdne i-tego ³adunku
% q_i - wartoœæ ³adunku;
% r_i - odleg³oœæ od pola elektrostatycznego.
% k = 1 / (4 pi * eps_0) = 8.987 * 10^9 [N * m^2 / C^2];
% eps_0 - przenikalnoœæ elektryczna pró¿ni;

% Natê¿enie jest wielkoœci¹ wektorow¹.

% Wypadkowe natê¿enie wynosi:
% E_w = \sum_{i = 1}^n E_i.

% Potencja³ pola elektrostatycznego wytwarzanego przez i-ty ³adunek w punkcie [x y] wynosi:
% V_i = (k * q_i) / r_i.

% Potencja³ jest wielkoœci¹ skalarn¹.

% Wypadkowy potencja³ wynosi:
% V_w = \sum_{i = 1}^n V_i.

% Bêdziemy obrazowaæ natê¿enie pola elektrostatycznego za pomoc¹ rysowanych strza³ek. W zale¿noœci od wielkoœci natê¿enia pola, strza³ki bêd¹ odpowiednio skalowane. 
% Bêdziemy wykreœlaæ strza³ki za pomoc¹ zdefiniowanej poni¿szej funkcji:
% drawArrow = @(x, y, c) quiver(x(1), y(1), x(2)-x(1), y(2)-y(1), c).    
% W pierwszym argumencie podajemy dwuwymiarowy wektor x = [x(1) x(2)], gdzie x(1) jest 1-sz¹ wspó³rzêdn¹ punktu pocz¹tkowego, a x(2) jest 1-sz¹ wspó³rz¹dn¹ punktu koñcowego, 
% natomiast w drugim podajemy dwuwymiarowy wektor y = [y(1) y(2)], gdzie, analogicznie, y(1) jest 2-g¹ wspó³rzêdn¹ punktu pocz¹tkowego, a y(2) jest 2-g¹ wspó³rzêdn¹ 
% punktu koñcowego. Natomiast w trzecim argumencie podajemy kolor wykreœlanej strza³ki. Bêdzie to istotne, gdy¿ bêdziemy chcieli zaznaczyæ, dla jakiego ³adunki jest wektor 
% natê¿enia pola.

% 1-szy, 2-gi argument funkcji quiver okreœlaj¹, odpowiednio, wspó³rzêdne pocz¹tku wykreœlanej strza³ki.
% 3-ci, 4-ty argument, okreœlaj¹ wektor przemieszczenia strza³ki.
% 5-ty argument, okreœla kolor rysowanej strza³ki.

% Szczegó³y o funkcji quiver() s¹ zawarte na nastêpuj¹cej stronie:
% https://www.mathworks.com/help/matlab/ref/quiver.html

%% Przyk³ady u¿ycia funkcji drawArrow

x1 = [10 30];
y1 = [10 30];

drawArrow = @(x, y, c) quiver(x(1), y(1), x(2)-x(1), y(2)-y(1), c);
drawArrow(x1, y1, 'r'); hold on;

x2 = [25 15];
y2 = [15 25];

drawArrow(x2, y2, 'b'); hold on;
% hold on powoduje, ¿e od tego momentu nowe obiekty bêd¹ dodawane do okna bez usuwania istniej¹cych obiektów.
% hold off powoduje, ¿e od tego momentu przed dodaniem jakiegokolwiek nowego obiektu okno graficzne bêdzie czyszczone.
 
x3 = [15 20];
y3 = [35 15];
drawArrow(x3, y3, 'g'); hold on;
title('Przyk³ady u¿ycia funkcji drawArrow');
legend(['x1 = [' num2str(x1(1)) ' ' num2str(x1(2)) '], ' 'y1 = [' num2str(y1(1)) ' ' num2str(y1(2)) ']'], ...
       ['x2 = [' num2str(x2(1)) ' ' num2str(x2(2)) '], ' 'y2 = [' num2str(y2(1)) ' ' num2str(y2(2)) ']'], ...
       ['x3 = [' num2str(x3(1)) ' ' num2str(x3(2)) '], ' 'y3 = [' num2str(y3(1)) ' ' num2str(y3(2)) ']']);
hold off;


% II) Symulacje

% 1. Kwadraty

%% a) Kwadrat o d³ugoœci boku równym 1 
% Wszystkie ³adunki o jednakowych wartoœciach q = 1C 
% Liczymy wypadkowe natê¿enie i wypadkowy potencja³ pola elektrostatycznego w œrodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, 1, 1, [0.5 0.5]);

% Wektora natê¿enia wypadkowego nie widaæ na wykresie, poniewa¿ jest równy wektorowi zerowemu.

%% b) Kwadrat o d³ugoœci boku równym 1
% q_1 = 1C, q_2 = 1C, q_3 = -1C, q_4 = -1C
% Liczymy wypadkowe natê¿enie i wypadkowy potencja³ pola elektrostatycznego w œrodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, -1, -1, [0.5 0.5]);

%% c) Kwadrat o d³ugoœci boku równym 1
% q_1 = 1C, q_2 = 1C, q_3 = 2C, q_4 = 2C
% Liczymy wypadkowe natê¿enie i wypadkowy potencja³ pola elektrostatycznego w œrodku kwadratu.

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 1, 2, 2, [0.5 0.5]);

%% d) Kwadrat o d³ugoœci boku równym 1
% q_1 = 1C, q_2 = 2C, q_3 = -1,5C, q_4 = -1,5C
% q_1 + q_2 + q_3 + q_4 = 0C
% Rozwa¿any punkt: Œrodek kwadratu

Natezenie_potencjal_4_punkty([0 0],[1, 0], [1, 1], [0 1], 1, 2, -1.5, -1.5, [0.5 0.5]);

% 2. Prostok¹ty

%% a) D³ugoœci boków: 2, 1
% Odpowiadaj¹ce ³adunki: 1C, 1C, 1C, 1C
% Rozwa¿any punkt: œrodek prostok¹ta, czyli [1 1/2]

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, 1, 1, 1, [1 1/2]);

%% b) D³ugoœci boków: 2, 1
% Odpowiadaj¹ce ³adunki: 1C, -1C, 1C, 1C
% Rozwa¿any punkt: œrodek prostok¹ta

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, -1, 1, 1, [1 1/2]);

%% c) D³ugoœci boków: 2, 1
% q_1 = 1C, q_2 = -1C, q_3 = -2C, q_4 = 2C
% q_1 + q_2 + q_3 + q_4 = 0C
% Rozwa¿any punkt: œrodek prostok¹ta

Natezenie_potencjal_4_punkty([0 0], [2 0], [2 1], [0 1], 1, -1, -2, 2, [1 1/2]);

% 3. Trójk¹ty
%% a) Trójk¹t równoramienny o wierzcho³kach: [0 0], [2 0], [1 1]
% Odpowiadaj¹ce ³adunki: 1C, 1C, 1C
% Rozwa¿any punkt: œrodek trójk¹ta

p_1 = [0 0];
p_2 = [2 0];
p_3 = [1 1];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];
    
Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 1, 1, 1, p_w);

%% b) Trójk¹t równoboczny o d³ugoœci boku równym 1
% Odpowiadaj¹cy ³adunki: 1C, 1C, 1C
% Rozwa¿any punkt: œrodek trójk¹ta

p_1 = [0 0];
p_2 = [1 0];
p_3 = [1/2 (1 * sqrt(3)/2)];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];

Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 1, 1, 1, p_w);

%% c) Trójk¹t równoboczny o d³ugoœci boku równym 1
% q_1 = 2C, q_2 = -1C, q_3 = -1C
% q_1 + q_2 + q_3 = 0C
% Rozwa¿any punkt: œrodek trójk¹ta

p_1 = [0 0];
p_2 = [1 0];
p_3 = [1/2 (1 * sqrt(3)/2)];

p_w = [mean([p_1(1) p_2(1) p_3(1)]) mean([p_1(2) p_2(2) p_3(2)])];

Natezenie_potencjal_3_punkty(p_1, p_2, p_3, 2, -1, -1, p_w);

% 4. Piêciok¹ty
%% a) Piêciok¹t foremny o d³ugoœciach boków równych 1
% q_1 = q_2 = q_3 = q_4 = q_5 = 1C

% Suma k¹tów w piêciok¹cie wynosi 540 stopni.

p_1 = [0 0];
p_2 = [1 0];
p_3 = [(1 + cos(2 * pi / 5)) sin(2 * pi / 5)];
p_4 = [(p_3(1) - cos(2 * pi * (36 / 360))) (p_3(2) + sin(2 * pi * (36 / 360)))];
p_5 = [(0 - cos(2 * pi / 5)) sin(2 * pi / 5)];

p_w = [mean([p_1(1) p_2(1) p_3(1) p_4(1) p_5(1)]) mean([p_1(2) p_2(2) p_3(2) p_4(2) p_5(2)])];
        
Natezenie_potencjal_5_punktow(p_1, p_2, p_3, p_4, p_5, 1, 1, 1, 1, 1, p_w);

%% b) Przyk³ad analogiczny
% Jedyna ró¿nica: q_1 = q_2 = -1C

p_1 = [0 0];
p_2 = [1 0];
p_3 = [(1 + cos(2 * pi / 5)) sin(2 * pi / 5)];
p_4 = [(p_3(1) - cos(2 * pi * (36 / 360))) (p_3(2) + sin(2 * pi * (36 / 360)))];
p_5 = [(0 - cos(2 * pi / 5)) sin(2 * pi / 5)];

p_w = [mean([p_1(1) p_2(1) p_3(1) p_4(1) p_5(1)]) mean([p_1(2) p_2(2) p_3(2) p_4(2) p_5(2)])];
        
Natezenie_potencjal_5_punktow(p_1, p_2, p_3, p_4, p_5, -1, 1, 1, -1, 2, p_w);

%% c) Piêciok¹t foremny o d³ugoœci boku równym 1
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
% 1. Je¿eli na ka¿dym wierzcho³ku wielok¹ta foremnego, ³adunki punktowe maj¹ tak¹ sam¹ wartoœæ, to w œrodku figury wypadkowy wektor natê¿enia pola elektrostatycznego 
% jest równy wektorowi zerowemu, ale w przypadku ³adunków o niezerowej wartoœci, wypadkowy potencja³ pola jest niezerowy.
% 2. W przypadku, gdy liczba wierzcho³ków wielok¹ta jest parzysta oraz wszystkie przek¹tne przechodz¹ przez œrodek figury, to w przypadku d³ugoœci boków wielok¹ta, 
% wystarczy tylko, by jego naprzeciwleg³e  wzglêdem siebie boki, mia³y tak¹ sam¹ d³ugoœæ.
% 3. Jeœli w figurze o parzystej liczbie boków, ka¿da para ³adunków punktowych znajduj¹ca siê na tej samej przek¹tnej danej figury, ma przeciwne znaki, i ma takie 
% same wartoœci bezwzglêdne, to w œrodku figury, wypadkowy potencja³ jest równy 0, ale w przypadku niezerowych ³adunków, wektor natê¿enia pola jest niezerowy.
% 4. W dowolnym wielok¹cie foremnym, suma wartoœci wszystkich ³adunków punktowych jest równa 0, to w œrodku figury, wypadkowy potencja³ pola elektrostatycznego, jest równy 0, 
% ale wypadkowy wektor natê¿enia pola, nie musi byæ równy wektorowi zerowemu.
% 5. Jeœli w wielok¹cie, odleg³oœæ ka¿dego wierzcho³ka od œrodka jest jednakowa (np. prostok¹t), to teza jest taka sama jak w poprzednim wniosku.