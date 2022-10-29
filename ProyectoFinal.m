close all
clear all
clc
%Leer archivos de audio
info =audioinfo('RespiraBien.wav');%Obtenga información sobre archivos de audio
[audio,Fs] = audioread('RespiraBien.wav');%Leer archivos de audio
sound(audio,Fs);%Reproducir archivos de audio
audiolength = length(audio);%Obtenga la longitud de datos del archivo de audio
t = 1:1:audiolength;
figure(1),
plot(t,audio(1:audiolength));
xlabel('Time');
ylabel('Audio Signal');
title('Diagrama de amplitud de señal del archivo de audio original');

%Dominio de frecuencia de audio
y =fft(audio);
y=20*log(abs(y))/log(10);        %Convertir a unidad dBW
f=[0:(Fs/audiolength):Fs/2];     %Convertir la abscisa a Hz
y=y(1:length(f));
figure(2),
plot(f,y);
xlabel('Frecuencia (Hz)','fontsize',8,'position',[180,-34.38,0]); 
ylabel('Potencia (dBW)');
title('Diagrama de espectro de señal del archivo de audio original');legend('Audio');