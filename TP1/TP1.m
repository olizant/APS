clc
clear all
close all

%% Ejercicio a)

fs= 150;    %definimos la frecuencia de muestreo.
Ts= 1/fs;   %tiempo de muestreo.
t1= 0.4:Ts:0.5; %variable de tiempo para el primer intervalo.
t2= 0.5:Ts:0.8; %variable de tiempo para el segundo intervalo.
% Cambiando los valores de inicio y final de cada intervalo, se controla
% cómo se grafican.

f1=8; %frecuencia 1
f2=4; %frecuencia 2

y1= sin(2*pi()*f1*t1); % muestreo del primer intervalo.
y2= sin(2*pi()*f2*t2); % muestreo del segundo intervalo.
Y= [y1,y2];
T= [t1,t2];

figure('Name','Gráfico señal Y(t)');
stem(T,Y) %resultado del muestreo.
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('a) Señal definida a partir de una función partida.');

%% Ejercicio b)

% Inicializamos los parámetros.
A1 = 5;               % Amplitud de la primera señal.
A2 = 2;               % Amplitud de la segunda señal.
f1 = 2;               % Frecuencia 1.
f2 = 50;              % Frecuencia 2.
fs = 100;             % Frecuencia de muestreo
t = 0:1/fs:1;         % Intervalo de tiempo.

% Superposición de ondas.
S = A1 * sin(2 * pi * f1 * t) + A2 * sin(2 * pi * f2 * t);

% Graficamos la señal.
figure('Name','Suma de señales senoidales en el dominio temporal');
plot(t, S);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('b) Señal definida a partir de la superposición de ondas sinusoidales.');
grid on;

hold on;
yline(0); 
plot(t, S, 'r.');
hold off;

%% Ejercicio c)
f0=3; % frecuencia fundamental = 3Hz
f=[-3, -2, -1, 0, 1, 2, 3]*f0; %vector de frecuencias de mi señal
X=[0.2, 0.7, 0.5, 1, 0.5, 0.7, 0.2]; %coeficientes de la Serie de fourier correspondientes a cada frecuencia
figure('Name','Componentes serie de Fourier');
stem(f,X), title('Serie de Fourier'); %graficamos la serie de fourier discreta
xlabel('Frecuencia [Hz]')
ylabel('Amplitud')

fs = 100; %definimos la frecuencia de muestreo.
Ts=1/fs;  %tiempo de muestreo.
t=0:Ts:2; %variable de tiempo


%Si el coseno es escrito como forma exponencial compleja:
%cos(2*pi*f0*t) = 1/2*e^(j*2*pi*f0*t) + 1/2*e^(-j*2*pi*f0*t)
%a simple vista se puede ver que es igual su desarrollo en serie de
%Fourier, y que f0 y -f0 tienen los dos un coeficiente de 1/2. Si a esto se lo
%multiplica por 2 y por el coeficiente que yo quiero, en este caso 0.7 por
%ejemplo: 2*0.7*cos(2*pi*f0*t) = 2*0.7*(1/2*e^(j*2*pi*f0*t) + 1/2*e^(-j*2*pi*f0*t))
%entonces: 2*0.7*cos(2*pi*f0*t) = 0.7*e^(j*2*pi*f0*t) + 0.7*e^(-j*2*pi*f0*t))
%la frecuencia queda con coeficiente 0.7, que es lo que se quería obtener.

%definimos los distintos "componentes" de la señal para después sumarlos
x0=X(4); %el DC offset, frecuenceia = 0, correspond a una corriente continua
x1=2*X(5)*cos(2*pi*f(5)*t); %componente con la frecuencia fundamental
x2=2*X(6)*cos(2*pi*f(6)*t); %componente con el primer armónico
x3=2*X(7)*cos(2*pi*f(7)*t); %componente con el segundo armónico

%graficamos los componentes de la señal, y se muestra la suma paso a paso
figure('Name','Señales en el dominio temporal de la serie de Fourier');
subplot(3,2,1)
    plot(t,x1),title('x1');
subplot(3,2,3)
    plot(t,x2),title('x2');
subplot(3,2,5)
    plot(t,x3),title('x3');
    subplot(3,2,2)
    plot(t,x0+x1),title('x0+x1'),axis([0 2 -1 4]);
subplot(3,2,4)
    plot(t,x0+x1+x2),title('x0+x1+x2'),axis([0 2 -1 4]);
subplot(3,2,6)
    plot(t,x0+x1+x2+x3),title('x0+x1+x2+x3 Señal '),axis([0 2 -1 4]);
