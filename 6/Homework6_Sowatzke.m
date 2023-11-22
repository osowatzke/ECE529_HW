% Author: O. Sowatzke
%
% Updated: 11/21/2023
%
% Subject: Script contains code for Homework 6
%

%% Problem 1a)
% length of array H
N = 16;

% cutoff frequency of filter
omega_c = 0.5*pi;

% create empty array for filter H
H = zeros(N,1);

% Frequency samples
omega_k = 2*pi*(0:N-1)/N;

% Find samples corresponding to cutoff frequency
[~, idx1] = min(abs(omega_k - omega_c));
[~, idx2] = min(abs(omega_k - (2*pi - omega_c)));

% Populate samples corresponding to cutoff frequency
H(idx1) = sqrt(2)/2;
H(idx2) = sqrt(2)/2;

% Create index k
k = 0:(N-1);

% Populate samples corresponding to passband of H
H(1:(idx1-1)) = 1;
H((idx2+1):end) = 1;

% Plot the array H
figure(1);
clf;
stem(k, H, 'LineWidth', 1.5);
title('Desired H(k) for LPF');
xlabel('k');
ylabel('H(k)')
grid on;

%% Problem 1b)
% %ake the inverse DFT of the samples of the array H
h = ifft(H);

% Take the real part of h only since H is real and even.
h = real(h);

% Plot the resulting impulse response
figure(2);
n = 0:(N-1);
stem(n,h,'LineWidth',1.5);
grid on;
xlabel('n');
ylabel('h(n)');
title('Inverse DFT of H(k)')

%% Problem 1c)
% Compute the frequency response corresponding to the filter h
H = fft(h);
stem(k,abs(H),'LineWidth',1.5);
grid on;
xlabel('k');
ylabel('H(k)');
title('DFT of h[n]');

%% Problem 1d)
% Create causal impulse response hc
hc = fftshift(h);
% hc(1) = hc(1)/2;
hc = [hc; hc(1)];
n = 0:(length(hc)-1);

% Plot the causal impulse response
stem(n, hc, 'Linewidth', 1.5);
xlabel('n');
ylabel('hc[n]')
title('Causal Impulse Response hc[n]');
grid on;

figure
plot((0:511)/512,abs(fft(hc,512)),'LineWidth',1.5);
hold on;
stem((0:15)/16,abs(H),'LineWidth',1.5)
grid on;
xlabel('Normalized Frequency (\times \pi rad/sample');
ylabel('Magnitude');
title('Comparison of Hc(e^{j\omega}) to H(k)')
legend('Hc(e^{j\omega})','H(k)')
