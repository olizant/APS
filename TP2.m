clc;
clear;
close all;

load("ECGx01.mat");

fs = 300;
Ts = 1/fs;

t = 1/300:Ts:11/3;

% Se crea la figura para poder juntar luego todos los subplots.

figure('Position', [100, 100, 1000, 600]); % Para ajustar el tamaño de 
                                           % los graficos.
                                           
tiledlayout(2, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

% Subplot 1: Señal original
nexttile;
plot(t, ECGx01);
title('Señal ECG Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');

%% Ejercicio a)

maximo = -100000;
minimo = 100000;
valorTotalECG = 0;

for i = 1:length(ECGx01) 
   if ECGx01(i) > maximo
       maximo = ECGx01(i);
   end

   if ECGx01(i) < minimo
       minimo = ECGx01(i);
   end
   valorTotalECG = valorTotalECG + ECGx01(i);
end

valorMedio = valorTotalECG/length(ECGx01);

% Se acondiciona la señal para que el valor medio sea 0.
ECGcentrado = ECGx01 - valorMedio;

% Se calcula la desviacion estandar.
for i=1:length(ECGx01)
    varianza=(ECGcentrado(i)-valorMedio)^2/(length(ECGx01)-1);
end
desvEstandar=sqrt(varianza);

% Se normaliza la señal para que el valor del pico positivo tenga una
% amplitud de 1.
ECGnormalizado = ECGcentrado / max(abs(ECGcentrado));

% Subplot 2: señal acondicionada y normalizada (sin funciones especificas
% de MatLab).
nexttile;
plot(t, ECGnormalizado);
title('Señal ECG Acondicionada y Normalizada');
xlabel('Tiempo (s)');
ylabel('Amplitud');

ECGmedio2 = mean(ECGnormalizado);
[minA2,maxA2] = bounds(ECGnormalizado);

%% Ejercicio b)

% Normalizar la señal utilizando la función normalize (Ejercicio b)
ECGancondicionadoB = normalize(ECGx01 - mean(ECGx01),'norm',inf);

% Subplot 3: señal normalizada utilizando la función "normalize".
nexttile;
plot(t, ECGancondicionadoB);
title('Señal ECG Normalizada (mediante la función "normalize")');
xlabel('Tiempo (s)');
ylabel('Amplitud');
