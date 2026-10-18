%% Question 4 (Lecture 4): Frequency Distribution of a Continuous Variable
clc; clear; close all;

w = [52 67 58 63 71 49 55 60 66 74 61 57 68 53 62 59 70 64 56 65 ...
     48 72 60 63 58 69 54 61 67 51 64 59 73 62 57 66 60 55 68 63];
n = numel(w);

k = 1 + 3.322*log10(n);                 % Sturges' rule  -> 6.32
R = max(w) - min(w);                    % range = 26
h = ceil(R/round(k));                   % class width = 5
fprintf('Min = %d, Max = %d, Range = %d\n', min(w), max(w), R);
fprintf('Sturges k = %.2f -> %d classes, width h = %d\n\n', k, round(k), h);

edges = 45:5:75;                        % class boundaries
f   = histc(w, edges); f = f(1:end-1);  % frequencies (lower <= x < upper)
mid = (edges(1:end-1) + edges(2:end))/2;
cf  = cumsum(f);

fprintf('%-10s %4s %9s %6s\n', 'Class', 'f', 'Mid-point', 'CumF');
for i = 1:numel(f)
    fprintf('%2d - <%-4d %4d %9.1f %6d\n', edges(i), edges(i+1), f(i), mid(i), cf(i));
end
fprintf('Total n = %d\n', sum(f));
[fm, im] = max(f);
fprintf('Modal class: %d - <%d (%d students)\n', edges(im), edges(im+1), fm);

figure('Position', [100 100 800 400]);
bar(mid, f, 1, 'FaceColor', [0.62 0.76 0.90], 'EdgeColor', 'k'); hold on
plot([mid(1)-h, mid, mid(end)+h], [0 f 0], '-o', 'LineWidth', 1.5);
set(gca, 'XTick', edges);
xlabel('Weight (kg)'); ylabel('Frequency');
title('Histogram and frequency polygon'); legend('Histogram', 'Polygon'); grid on
print('-dpng', '-r130', 'images/Q4_continuous_frequency.png');
