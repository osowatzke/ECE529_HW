%% Problem 2.21 Figure in Problem Statement
x = [zeros(1,4), ones(1,5), 0.5, zeros(1,6)];
n = -5:10;
figure(1);
clf;
stem(n,x,'k','filled');
xlabel('n')
ylabel('x[n]');

%% Problem 2.21c - x[2n]
x = [zeros(1,2) ones(1,2), 0.5, zeros(1,3)];
n = -2:5;
figure(2);
clf;
stem(n,x,'k','filled');
xlabel('n')
ylabel('x[2n]');

%% Problem 2.21e - x[n-1]*delta[n-3]
% x[n-1]
x1 = [zeros(1,5), ones(1,5), 0.5, zeros(1,5)];
n = -5:10;
figure(3);
clf;
stem(n,x1,'k','filled');
xlabel('n')
ylabel('x[n - 1]');

% delta[n-3]
x2 = [zeros(1,8), 1, zeros(1,7)];
n = -5:10;
figure(4);
clf;
stem(n,x2,'k','filled');
xlabel('n')
ylabel('\delta[n - 3]');

% x[n-1]*delta[n-3]
x = x1.*x2;
n = -5:10;
figure(5);
clf;
stem(n,x,'k','filled');
xlabel('n')
ylabel('x[n - 1] \delta[n - 3]');