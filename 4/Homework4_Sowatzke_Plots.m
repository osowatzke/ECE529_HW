% Author: O. Sowatzke
%
% Updated: 10/22/2023
%
% Subject: Function creates pole-zero plots for Homework 4
%

%% Problem 3.40a)

% Close all open figures
close all;
clear;

% Create figure
f = figure(1);
clf;
hold on;

% Make figure square
pos = f.Position;
pos(2) = pos(2) + (pos(4) - pos(3))/2;
pos(4) = pos(3);
f.Position = pos;

% plot poles and zeros
% using scatter instead of pzmap to customize marker size
scatter(0.5, 0, 72, 'kx', 'lineWidth',0.75);
scatter([0 1], [0 0], 72, 'ko', 'lineWidth',0.75);

% plot real and imaginary axis
plot([-1 1],[0 0],':k');
plot([0 0],[-1 1],':k');

% plot unit circle
x = -1:0.001:1;
y = sqrt(1-x.^2);
plot(x,y,':k');
plot(x,-y,':k');

% Label plot
title('Pole-Zero Map')
xlabel('Real Axis');
ylabel('Imaginary Axis');
box on;

% Mark the ROC boundary
x = -0.5:0.001:0.5;
y = sqrt(0.5^2-x.^2);
plot(x,y,'k')
plot(x,-y,'k');

% Shade the ROC
x = [-1 -1 1 1 flip(x)];
y = [0 1 1 0 flip(y)];
fill(x,y,'k','FaceAlpha',0.1,'LineStyle','none');
fill(x,-y,'k','FaceAlpha',0.1,'LineStyle','none');

% Denote poles and zeros at infinity
text(0.25,0.75,'X @ z = \infty');

%% Problem 3.40a)
% Create pole-zero map for Y(z)
f = figure(2);
clf;
hold on;

% Make figure square
pos = f.Position;
pos(2) = pos(2) + (pos(4) - pos(3))/2;
pos(4) = pos(3);
f.Position = pos;

% plot poles and zeros
% using scatter instead of pzmap to customize marker size
scatter([0.5 2], [0 0], 72, 'kx', 'lineWidth',0.75);
scatter([0 0.25], [0 0], 72, 'ko', 'lineWidth',0.75);

% plot real and imaginary axis
plot([-1 2],[0 0],':k');
plot([0 0],[-1.5 1.5],':k');

% plot unit circle
x = -1:0.001:1;
y = sqrt(1-x.^2);
plot(x,y,':k');
plot(x,-y,':k');

% Label plot
title('Pole-Zero Map')
xlabel('Real Axis');
ylabel('Imaginary Axis');
box on;

% Create pole-zero map for X(z)
f = figure(3);
clf;
hold on;

% Make figure square
pos = f.Position;
pos(2) = pos(2) + (pos(4) - pos(3))/2;
pos(4) = pos(3);
f.Position = pos;

% plot poles and zeros
% using scatter instead of pzmap to customize marker size
scatter([-0.75 0.5], [0 0], 72, 'kx', 'lineWidth',0.75);
scatter(0.25, 0, 72, 'ko', 'lineWidth',0.75);

% plot real and imaginary axis
plot([-1 1],[0 0],':k');
plot([0 0],[-1 1],':k');

% plot unit circle
x = -1:0.001:1;
y = sqrt(1-x.^2);
plot(x,y,':k');
plot(x,-y,':k');

% Denote poles and zeros at infinity
text(0.25,0.5,'O @ z = \infty');

% Label plot
title('Pole-Zero Map')
xlabel('Real Axis');
ylabel('Imaginary Axis');
box on;

% Create pole-zero map for H(z)
f = figure(4);
clf;
hold on;

% Make figure square
pos = f.Position;
pos(2) = pos(2) + (pos(4) - pos(3))/2;
pos(4) = pos(3);
f.Position = pos;

% plot poles and zeros
% using scatter instead of pzmap to customize marker size
scatter(2, 0, 72, 'kx', 'lineWidth',0.75);
scatter([0 -0.75], [0 0], 72, 'ko', 'lineWidth',0.75);

% plot real and imaginary axis
plot([-2 2],[0 0],':k');
plot([0 0],[-2 2],':k');

% plot unit circle
x = -1:0.001:1;
y = sqrt(1-x.^2);
plot(x,y,':k');
plot(x,-y,':k');

% Label plot
title('Pole-Zero Map')
xlabel('Real Axis');
ylabel('Imaginary Axis');
box on;

% Mark the ROC boundary
x = -2:0.001:2;
y = sqrt(2^2-x.^2);
plot(x,y,'k')
plot(x,-y,'k');

% Shade the ROC
x = [x flip(x)];
y = [y -flip(y)];
fill(x,y,'k','FaceAlpha',0.1,'LineStyle','none');

% Denote poles and zeros at infinity
text(0.25,1.5,'X @ z = \infty');
