% x[n] is only non-zero for 0 <= n <= 2
n = 0:2;
x = n+1;

% h[n] definition
h = [0.5 -0.25];

y = conv(x,h);

% plot x[n]
figure(1);
clf;
n = -2:5;
x = [zeros(1,2) x zeros(1,3)];
stem(n,x,'filled','k');
xlabel('n');
ylabel('x[n]');

% plot h[n]
figure(2);
clf;
n = -2:5;
h = [zeros(1,2) h zeros(1,4)];
stem(n,h,'filled','k');
xlabel('n');
ylabel('h[n]');

% plot x[k]
figure(3);
clf;
stem(n,x,'filled','k');
xlabel('k');
ylabel('x[k]');

% plot h[k]
figure(4);
clf;
stem(n,h,'filled','k');
xlabel('k');
ylabel('h[k]');

% plot h[-k]
figure(5);
clf;
h = flip(h);
h = [h(4:end) zeros(1,3)];
stem(n,h,'filled','k');
xlabel('k');
ylabel('h[-k]');

% plot h[n-k]
figure(6);
clf;
stem(n,h,'filled','k');
xlabel('k');
ylabel('h[n-k]');
ticks = xticks;
ticklabels = cellfun(@formatTicks,num2cell(ticks),'UniformOutput',false);
xticklabels(ticklabels);

figure(7);
clf;
y = [zeros(1,2) y zeros(1,2)];
stem(n,y,'filled','k');
xlabel('n');
ylabel('y[n]');

function y = formatTicks(x)
    if (x==0)
        y = 'n';
    elseif (x < 0)
        y = sprintf('n-%d',-x);
    else
        y = sprintf('n+%d', x);
    end
end