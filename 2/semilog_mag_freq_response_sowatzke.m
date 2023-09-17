% Author: O. Sowatzke
%
% Updated: 09/19/2023
%
% Subject: Script plots the semilog magnitude frequency response of a
% filter specified by a difference equation

close all;
clear;

% Numerator and denominator coefficients of transfer function
% specified by problem 5. Type "help freqz" for more details on
% formatting arrays of coefficients
a = [1, 1.6511, 1.0893, 0.2447];
b = [0.0585, -0.0382, 0.0382, -0.0585];

% Save 512 samples of the freq response
% 'whole' outputs frequency response over interval [0 2*pi)
[H,w] = freqz(b,a,'whole');

% semilog plot of the mag freq response
% fftshift allows us to plot frequency response over interval [-pi pi) 
semilogy(w-pi,fftshift(abs(H)),'lineWidth',1.5);

% add labels to each axis and a title
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Semilogarithmic Magnitude Frequency Response');

% Set Bounds of xaxis
xlim([-pi pi]);

% Set ticks on x axis and label ticks in terms of pi
xticks(-pi:pi/4:pi);
xticklabels({'-\pi','-3\pi/4','-\pi/2','-\pi/4','0',...
    '\pi/4','\pi/2','3\pi/4','\pi'});

% Turn on grid for readability
grid on;
