function symuluj = Natezenie_potencjal_4_punkty(p_1, p_2, p_3, p_4, q_1, q_2, q_3, q_4, p_w)

% Funkcja Natezenie_potencjal() wykonuje symulacjê, w której liczone jest wypadkowe natê¿enie pola elektrostatycznego, wypadkowy potencja³ pola elektrostatycznego
% oraz kreœlone s¹ strza³ki okreœlaj¹ce natê¿enia pola dla uk³adu 4 ³adunków punktowych, czyli na przyk³ad kwadratu, prostok¹ta. Funkcja przyjmuje 9 argumentów. 
% W argumentach 1-4 podajemy wspó³rzêdne ³adunków, w 5-8 wartoœci ³adunków (q_1 to ³adunek dla punktu p_1, q_2 to ³adunek dla punktu p_2, itd.), a w 9 argumencie podajemy punkt,
% w którym liczymy wypadkowe natê¿enie oraz wypadkowy potencja³ pola.

plot(p_1(1), p_1(2), 'o', 'MarkerSize', abs(q_1) * 10, 'MarkerFaceColor', 'b'); hold on;
plot(p_2(1), p_2(2), 'o', 'MarkerSize', abs(q_2) * 10, 'MarkerFaceColor', 'r'); hold on;
plot(p_3(1), p_3(2), 'o', 'MarkerSize', abs(q_3) * 10, 'MarkerFaceColor', 'y'); hold on;
plot(p_4(1), p_4(2), 'o', 'MarkerSize', abs(q_4) * 10, 'MarkerFaceColor', 'g'); hold on;
plot(p_w(1), p_w(2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'c'); hold on;


% W natê¿eniu istotny jest tylko kierunek natê¿enia, ³adunek oraz promieñ.
% Natê¿enie bêdziemy dzieliæ przez 4k.

% Odleg³oœæ od pola liczymy z Twierdzenia Pitagorasa.
r_1 = sqrt((p_1(1) - p_w(1))^2 + (p_1(2) - p_w(2))^2);
E_1 = (1/4) * (q_1/(r_1^2)) * [(p_w(1) - p_1(1)) (p_w(2) - p_1(2))];

r_2 = sqrt((p_2(1) - p_w(1))^2 + (p_2(2) - p_w(2))^2);
E_2 = (1/4) * (q_2/(r_2^2)) * [(p_w(1) - p_2(1)) (p_w(2) - p_2(2))];

r_3 = sqrt((p_3(1) - p_w(1))^2 + (p_3(2) - p_w(2))^2);
E_3 = (1/4) * (q_3/(r_3^2)) * [(p_w(1) - p_3(1)) (p_w(2) - p_3(2))];

r_4 = sqrt((p_4(1) - p_w(1))^2 + (p_4(2) - p_w(2))^2);
E_4 = (1/4) * (q_4/(r_4^2)) * [(p_w(1) - p_4(1)) (p_w(2) - p_4(2))];

% Rysujemy wektory natê¿eñ dla wszystkich ³adunków.  
% W definicji oddzielnej funkcji, trzeba t¹ funkcjê drawArrow(x, y, c) zdefiniowaæ.
drawArrow = @(x, y, c) quiver(x(1), y(1), x(2)-x(1), y(2)-y(1), c);
ar1 = drawArrow([p_w(1) (p_w(1) + E_1(1))], [p_w(2)  (p_w(2) + E_1(2))], 'b'); hold on;
ar2 = drawArrow([p_w(1) (p_w(1) + E_2(1))], [p_w(2)  (p_w(2) + E_2(2))], 'r'); hold on;
ar3 = drawArrow([p_w(1) (p_w(1) + E_3(1))], [p_w(2)  (p_w(2) + E_3(2))], 'y'); hold on;
ar4 = drawArrow([p_w(1) (p_w(1) + E_4(1))], [p_w(2)  (p_w(2) + E_4(2))], 'g'); hold on;

E_w = E_1 + E_2 + E_3 + E_4;

% Teraz narysujemy wektor natê¿enia wypadkowego.
drawArrow([p_w(1) (p_w(1) + E_w(1))], [p_w(2)  (p_w(2) + E_w(2))], 'c'); hold on;

% Liczymy potencja³y dla ka¿dego ³adunku.

k = 8.987 * 10^9;

V_1 = k * q_1 / r_1;
V_2 = k * q_2 / r_2;
V_3 = k * q_3 / r_3;
V_4 = k * q_4 / r_4;

% Obliczamy potencja³ wypadkowy.
V_w = V_1 + V_2 + V_3 + V_4;

% Tutaj mno¿ymy E_w przez 4k, gdy¿ wczeœniej w celu przeskalowania, dzieliliœmy przez 4k.
title(['E_w = [' num2str(E_w(1) * (4 * k) / (10^9)) ' * 10^9   ' num2str(E_w(2) * (4 * k) / (10^9)) ' * 10^9 ], V_w = ' num2str(V_w / 10^9) ' * 10^9']);
ar1.Annotation.LegendInformation.IconDisplayStyle = 'off';
ar2.Annotation.LegendInformation.IconDisplayStyle = 'off';
ar3.Annotation.LegendInformation.IconDisplayStyle = 'off';
ar4.Annotation.LegendInformation.IconDisplayStyle = 'off';
legend(['q_1 = ' num2str(q_1) 'C'], ['q_2 = ' num2str(q_2) 'C'], ['q_3 = ' num2str(q_3) 'C'], ['q_4 = ' num2str(q_4) 'C'], 'Rozwa¿any punkt', 'Wypadkowe natê¿enie pola');


% Wypisujemy natê¿enia oraz potencja³y wszystkich pojedyñczych ³adunków.
E_1 = E_1 * (4 * k)
E_2 = E_2 * (4 * k)
E_3 = E_3 * (4 * k)
E_4 = E_4 * (4 * k)

V_1
V_2
V_3
V_4

hold off;
