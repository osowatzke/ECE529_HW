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
clf;
n = 0:(N-1);
stem(n,h,'LineWidth',1.5);
grid on;
xlabel('n');
ylabel('h(n)');
title('Inverse DFT of H(k)')

%% Problem 1c)
% Compute the DFT samples corresponding to the filter h
H = fft(h);

% Plot the DFT samples
figure(3)
clf;
stem(k,abs(H),'LineWidth',1.5);
grid on;
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
figure(4);
clf;
stem(n, hc, 'Linewidth', 1.5);
xlabel('n');
ylabel('hc[n]')
title('Causal Impulse Response hc[n]');
grid on;

% Compare the resulting frequency response to the original H(k) samples
Hc = fft(hc,512);
f = 2*(0:511)/512;
figure(5)
clf;
plot(f,abs(Hc),'LineWidth',1.5);
hold on;
f = 2*(0:15)/16;
stem(f,abs(H),'LineWidth',1.5)
grid on;
xlabel('Normalized Frequency (\times \pi rad/sample');
ylabel('Magnitude');
title('Comparison of Hc(e^{j\omega}) to H(k)')
legend('Hc(e^{j\omega})','H(k)');

% Now compare the frequency response to the original H(k) samples if we
% simply duplicated the last sample
hc2 = [2*hc(1); hc(2:(end-1)); 2*hc(end)];
Hc2 = fft(hc2,512);
f = 2*(0:511)/512;
figure(6)
clf;
plot(f,abs(Hc2),'LineWidth',1.5);
hold on;
f = 2*(0:15)/16;
stem(f,abs(H),'LineWidth',1.5)
grid on;
xlabel('Normalized Frequency (\times \pi rad/sample');
ylabel('Magnitude');
title('Comparison of Hc(e^{j\omega}) to H(k)')
legend('Hc(e^{j\omega})','H(k)');

%% Problem 1e)
% Compute the frequency response of the casual filter
[Hc,w] = freqz(hc,1,512);

% Plot the frequency response
figure(7)
clf;
semilogy(w/pi,abs(Hc),'LineWidth',1.5);

% Set limits for Y axis
ylim([0.001 2]);

% Label plot
xlabel('Normalized Frequency (\times \pi rad/sample)')
ylabel('Magnitude');
title('Magnitude Frequency Response')

% Turn on grid
grid on;

%% Problem 1f)
% Multiply the impulse response by a Hamming window
hc = hc.*hamming(length(hc));

% Compute the frequency response
[Hc,w] = freqz(hc,1,512);

% Plot the frequency response
figure(7)
clf;
semilogy(w/pi,abs(Hc),'LineWidth',1.5);

% Set limits for Y axis
ylim([1e-4 2]);

% Label plot
xlabel('Normalized Frequency (\times \pi rad/sample)')
ylabel('Magnitude');
title('Magnitude Frequency Response')

% Turn on grid
grid on;

%% Problem 1g)
% Design 17 tap filter with fir2 command
%
% Note that the FIR2 function will force the size of the DFT to be a
% power of 2 that is equal to or larger than the filter length. Because
% the filter length is 17, it will use a DFT size of 32 samples.
%
% Because the DFT size is different, the filter designed with the fir2
% command will not be exactly the same as the analytically derived filter.
%
h = fir2(16,0:0.125:1,[1 1 1 1 sqrt(2)/2 0 0 0 0],16,0);

% Overlay the impulse response of the causal, symmetric filter and the
% result of the fir2 command
figure(8);
clf;
n = 0:(length(h)-1);
stem(n,hc,'LineWidth',1.5);
hold on;
stem(n,h,'LineWidth',1.5);
grid on;
legend('hc[n]','hm[n]');
xlabel('n');
ylabel('Value');
title('Impulse Response Comparison')

% Plot the frequency response of both filters for comparison
figure(9);
clf;
[Hc,~] = freqz(hc,1,512);
[H,w] = freqz(h,1,512);
semilogy(w/pi,abs(Hc),'LineWidth',1.5);
hold on;
semilogy(w/pi,abs(H),'LineWidth',1.5);
ylim([1e-4 2]);
grid on;
xlabel('Normalized Frequency (/times /pi rad/sample)')
ylabel('Magnitude');
title('Magnitude Frequency Response Comparison')
legend('Hc(e^{j\omega})','Hm(e^{j\omega})')

%% Problem 2
% Design FIR filter with the firpm function
h = firpm(16,[0 0.37 0.71 1],[1 1 0 0]);

% Plot the frequency response of the resulting filter
figure(10);
clf;
[H,w] = freqz(h,1,512);
semilogy(w/pi,abs(H),'LineWidth',1.5);
grid on;
xlabel('Normalized Frequency (/times /pi rad/sample)')
ylabel('Magnitude');
title('Magntiude Frequency Response');