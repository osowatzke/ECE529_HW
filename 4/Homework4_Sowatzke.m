% %% Problem 3.8a)
% a = [1 0.75];
% b = [1 -1];
% y1 = filter(b,a,[1 zeros(1,99)]);
% n = 0:99;
% y2 = (-3/4).^n - [0 (-3/4).^n(1:(end-1))];
% figure(1);
% clf;
% plot(n,y1);
% hold on;
% plot(n,y2);
% 
% %% Problem 3.8b)
% x = (1/3).^n;
% y1 = filter(b,a,x);
% y1 = y1 + filter(b,a,-ones(1,100));
% y2 = (-8/13)*(1/3).^n + (8/13)*(-3/4).^n;
% figure(2);
% clf;
% plot(n,y1);
% hold on;
% plot(n,y2);
% 
% %% Problem 3.10f)
% syms n z;
% sympref('HeavisideAtOrigin', 1);
% x1 = (1/2)^(n-1)*heaviside(n);
% x2 = (2+1i*3)^(n-2)*heaviside(-n-1);
% X = ztrans_two_sided(x1+x2);
% X = simplifyFraction(X);

n = 0:99;
h1 = (5/3)*(1/4).^n + (7/3)*(-1/2).^n;
h2 = (1/6)*(1/4).^(n-2) + (1/3)*(-1/2).^(n-2);
h1(3:end) = h1(3:end) - h2(3:end);
h2 = -(1/4).^n+(-1/2).^n;
h2(1) = h2(1) + 4;
h3 = -(1/3)*(1/4).^n - (2/3)*(-1/2).^n;
h3(1) = h3(1) + 4;
figure(3)
clf;
plot(h1);
hold on;
plot(h3);

