%% Question 5: Frequency Curves and Data Presentation (test scores)
clc; clear; close all;

sc = [42 55 61 67 72 74 81 69 58 63 77 85 91 48 52 66 71 73 79 82 88 93 57 62 68 75 80 84 87 90 ...
      45 50 59 64 70 76 78 83 86 89 94 96 54 60 65 72 74 81 85 92];
n = numel(sc);

edges = 40:10:100;                                   % classes 40-49, 50-59, ... , 90-99
freq  = histc(sc, [edges(1:end-1) Inf]); freq = freq(1:end-1);
if sum(freq) ~= n, error('Some scores fall outside the classes'); end
relF = freq / n;
cumF = cumsum(freq);
mid  = [44.5 54.5 64.5 74.5 84.5 94.5];

fprintf('%-8s %4s %6s %4s %6s\n', 'Class', 'f', 'RF', 'CF', 'Mid');
for i = 1:6
    fprintf('%d-%-5d %4d %6.2f %4d %6.1f\n', edges(i), edges(i)+9, freq(i), relF(i), cumF(i), mid(i));
end
fprintf('Total n = %d, highest frequency = %d\n', n, max(freq));

figure('Position', [100 100 1100 750]);
subplot(2,2,1);
bar(mid, freq, 1, 'FaceColor', [0.4 0.6 0.9], 'EdgeColor', 'k'); grid on;
xlabel('Test score'); ylabel('Frequency'); title('Histogram'); ylim([0 14]);

subplot(2,2,2);
xp = [mid(1)-10, mid, mid(end)+10]; yp = [0 freq 0];
plot(xp, yp, '-o', 'LineWidth', 1.6, 'MarkerFaceColor', [0.85 0.4 0.2]); grid on;
xlabel('Class midpoint'); ylabel('Frequency'); title('Frequency polygon'); ylim([0 14]);

subplot(2,2,3);
plot(edges, [0 cumF], '-s', 'LineWidth', 1.6, 'MarkerFaceColor', [0.2 0.6 0.4]); grid on;
set(gca, 'XTick', edges);
xlabel('Upper class boundary'); ylabel('Cumulative frequency'); title('Cumulative frequency curve');

subplot(2,2,4);
bar(mid, freq, 1, 'FaceColor', [0.8 0.85 0.95], 'EdgeColor', 'k'); hold on;
plot(xp, yp, '-or', 'LineWidth', 1.5); grid on;
xlabel('Test score'); ylabel('Frequency'); title('Histogram with polygon'); ylim([0 14]);
print('-dpng', '-r130', 'images/Q5_frequency_curves.png');
