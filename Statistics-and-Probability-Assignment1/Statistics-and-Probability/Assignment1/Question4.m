%% Question 4: Frequency Distribution of a Continuous Variable (response times)
clc; clear; close all;

n = 40; xmin = 112; xmax = 162;                     % given (ms)
R = xmax - xmin;                                    % range
K = 1 + 3.322 * log10(n);                           % Sturges' rule
fprintf('Range R = %d ms\nSturges K = %.2f -> %d classes\n', R, K, ceil(K));
fprintf('Class width = R/K = %.2f -> convenient width 8 ms\n\n', R / ceil(K));

w      = 8;
lower  = 112:w:160;                                 % 112,120,...,160
upper  = lower + w;                                 % 120,...,168 (upper class boundaries)
freq   = [3 6 8 7 8 6 2];                           % from the tally
relF   = freq / n;
cumF   = cumsum(freq);
mid    = (lower + upper) / 2;

fprintf('%-10s %6s %8s %6s\n', 'Class', 'f', 'RF', 'CF');
for i = 1:numel(freq)
    fprintf('%3d-%-6d %6d %8.3f %6d\n', lower(i), upper(i)-1, freq(i), relF(i), cumF(i));
end
fprintf('%-10s %6d %8.3f %6d\n\n', 'Total', sum(freq), sum(relF), cumF(end));

% Median class: middle observations are the 20th and 21st
medIdx = find(cumF >= n/2, 1);
fprintf('Median class: %d-%d ms\n', lower(medIdx), upper(medIdx)-1);
Fprev  = cumF(medIdx) - freq(medIdx);
medEst = lower(medIdx) + (n/2 - Fprev) / freq(medIdx) * w;
fprintf('Estimated median = %.2f ms\n', medEst);

figure('Position', [100 100 950 380]);
subplot(1,2,1);
bar(mid, freq, 1, 'FaceColor', [0.35 0.6 0.85], 'EdgeColor', 'k'); grid on;
set(gca, 'XTick', lower(1):w:upper(end));
xlabel('Response time (ms)'); ylabel('Frequency'); title('Histogram of response times'); ylim([0 10]);
subplot(1,2,2);
plot([lower(1) upper], [0 cumF], '-s', 'LineWidth', 1.6, 'MarkerFaceColor', [0.85 0.4 0.2]); grid on;
set(gca, 'XTick', lower(1):w:upper(end));
xlabel('Upper class boundary (ms)'); ylabel('Cumulative frequency'); title('Cumulative frequency curve (ogive)');
print('-dpng', '-r130', 'images/Q4_continuous_frequency.png');
