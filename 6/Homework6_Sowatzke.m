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

% Populate samples corresponding to passband of H
H(1:(idx1-1)) = 1;
H((idx2+1):end) = 1;

% Plot the array H
plot(omega_k/pi, H, '-o', 'LineWidth', 1.5);
title('Plot of Values in the Array H');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude')
grid on;

%% Problem 1b)
% %ake the inverse DFT of the samples of the array H
h = ifft(H);

% Ignore the real part since H is real and even.
h = real(h);

% Plot the resulting impulse response
n = 0:(N-1);
stem(n,h,'LineWidth',1.5);
grid on;
xlabel('n');
ylabel('h(n)');
title('Inverse DFT of the Array H')

%% Problem 1c)
% Compute the frequency response corresponding to the filter h
H = fft(h);
stem(abs(H));
xlabel('k');
ylabel('H(k)');
title('DFT of h[n]');

%% Problem 1d)
% Create causal impulse response hc
hc = fftshift(h);
hc(1) = hc(1)/2;
hc = [hc; hc(1)];
n = 0:(length(hc)-1);

% Plot the causal impulse response
stem(n, hc);
xlabel('n');
ylabel('hc[n]')
title('Plot of the Causal Impulse Response hc[n]');
