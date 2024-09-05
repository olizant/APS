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

%% Ejercicio c)

figure('Position', [400, 100, 1000, 600]);  % Para ajustar el tamaño de los graficos
tiledlayout(2, 1, 'Padding', 'compact', 'TileSpacing', 'compact');

% Defino frecuencias y vectores tiempo
fs1 = 500;
fs2 = 1000;
t1 = 0:1/fs1:0.1;
t2 = 0:1/fs2:0.1;

% frecuencias y amplitudes
f1 = 25;
f2 = 75;
A1 = 10;
A2 = 4;

% Defino funcion
y = @(t,f,A)  A*sin(2*pi()*f*t);    % Funcion sinusoidal

% Muestreo a 500Hz
nexttile;
stem(t1,y(t1,f1,A1)+y(t1,f2,A2));
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Suma de sinusoides con frecuencia de muestreo igual a 500Hz');


% Muestreo a 1000Hz
nexttile;
stem(t2,y(t2,f1,A1)+y(t2,f2,A2));
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Suma de sinusoides con frecuencia de muestreo igual a 1000Hz');

%Los dos algoritmos utilizados a continuacion calculan valores rms, elija uno a utilizar

%Si la frecuencia de muestreo es mayor, el valor de la funcion rms() se
%acerca mas al valor calculado con el metodo de trapecios, esto seguro se
%debe a que la funcion rms() emplea el metodo de rieman a la hora de
%intregrar

% t2=0:1/100000:0.1;      % prueba de que a mayor frec. de muestreo mas se acercan los valores

Y = y(t2,f1,A1)+y(t2,f2,A2);
paso = (t2(end)-t2(1))/length(t2);

Vrms1 = sqrt(1/(t2(end-t2(1)))*sum(paso*(Y.^2)));    %Calcula rms usando metodo de Rieman
Vrms1 = sqrt(1/(t2(end))*trapz(t2,(Y.^2)));    %Calcula rms usando metodo de trapecios

Vrms2 = rms(Y);

% Imprimo en pantalla
x = ['El valor RMS calculado empleando un algoritmo propio fue de (',num2str(Vrms1),') y usando la funcion rms() de matlab (',num2str(Vrms2),')'];
disp(x)





