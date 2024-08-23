clc
clear all
close all

fs = 150; %defino frecuencia de muestreo
Ts = 1/fs; %tiempo de muestreo

t1 = 0.4:Ts:0.5; %variable tiempo para primer intervalo
t2 = 0.5:Ts:0.8; %variable tiempo para segundo intervalo
%cambiando los valores de inicio y final de cada intervalo controlo como se
%grafican, así como está va de 0,4 a 0,8 segundos, como pide la consigna

f1 = 8; %frecuencia 1
f2 = 4; %frecuencia 2

y1 = sin(2 * pi()*f1*t1); %intervalo 1 muestreado
y2 = sin(2 * pi()*f2*t2); %intervalo 2 muestreado

Y = [y1,y2]; 
T = [t1,t2];
stem(T, Y) %muestro el resultado del muestreo


% f0=1; % Frecuencia fundamental = 1Hz
% f=[-3, -2, -1, 0, 1, 2, 3]*f0;
% % Coeficientes de la Serie de fourier
% X=[1/3, 1/2, 1/4, 1, 1/4, 1/2, 1/3];
% stem(f,X), title('Serie de Fourier');
% 
% fs = 150;
% %frecuencia de muestreo Ts=1/fs
% Ts=0.01;
% %variable tiempo
% t=0:Ts:6;
% 
% x0=X(4);
% x1=2*X(5)*cos(2*pi*f0*t);
% x2=2*X(6)*cos(2*pi*2*f0*t);
% x3=2*X(7)*cos(2*pi*3*f0*t);
% figure()
% 
% 
% subplot(3,2,1)
%     plot(t,x1),title('x1');
% subplot(3,2,3)
%     plot(t,x2),title('x2');
% subplot(3,2,5)
%     plot(t,x3),title('x3');
%     subplot(3,2,2)
%     plot(t,x0+x1),title('x0+x1'),axis([0 6 -1 4]);
% subplot(3,2,4)
%     plot(t,x0+x1+x2),title('x0+x1+x2'),axis([0 6 -1 4]);
% subplot(3,2,6)
%     plot(t,x0+x1+x2+x3),title('x0+x1+x2+x3 Señal '),axis([0 6 -1 4]);