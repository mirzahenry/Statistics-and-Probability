%% Question 6: Stem-and-Leaf Display and Central Tendency (execution times, s)
clc; clear; close all;

x = [12 15 17 18 19 21 21 23 24 24 25 26 27 28 28 29 31 32 34 35 36 38 41 43 47];
n = numel(x);

% Stem-and-leaf (stem = tens digit, leaf = units digit)
x = sort(x);
stems = floor(x/10); leaves = mod(x,10);
disp('Stem-and-leaf display   (Key: 2 | 1 = 21 s)');
for s = min(stems):max(stems)
    fprintf('%2d | %s\n', s, sprintf('%d ', leaves(stems == s)));
end

% Central tendency
meanX   = sum(x) / n;
medianX = x((n+1)/2);                                % 13th value for n = 25
u = unique(x); c = arrayfun(@(v) sum(x == v), u);
modes   = u(c == max(c));
fprintf('\nSum = %d, n = %d\n', sum(x), n);
fprintf('Mean   = %.2f s\nMedian = %d s (position %d)\nMode   = %s (each occurs %d times)\n', ...
        meanX, medianX, (n+1)/2, num2str(modes), max(c));

% Quartiles (median-of-halves method) for the boxplot
lowerHalf = x(1:(n-1)/2);  upperHalf = x((n+3)/2:end);
Q1 = median(lowerHalf); Q3 = median(upperHalf);
fprintf('Q1 = %g, Q3 = %g, IQR = %g\n', Q1, Q3, Q3-Q1);
if meanX > medianX, disp('Mean > median: slightly right-skewed.'); end

figure('Position', [100 100 950 380]);
subplot(1,2,1); hold on;                              % boxplot drawn manually
fill([0.7 1.3 1.3 0.7], [Q1 Q1 Q3 Q3], [0.6 0.8 0.6]);
plot([0.7 1.3], [medianX medianX], 'k', 'LineWidth', 2);
plot([1 1], [min(x) Q1], 'k'); plot([1 1], [Q3 max(x)], 'k');
plot([0.85 1.15], [min(x) min(x)], 'k'); plot([0.85 1.15], [max(x) max(x)], 'k');
plot(1, meanX, 'r^', 'MarkerFaceColor', 'r');
xlim([0.4 1.6]); set(gca, 'XTick', []); grid on;
ylabel('Execution time (s)'); title('Boxplot (red = mean)');
subplot(1,2,2);
cnt = arrayfun(@(a) sum(x >= a & x < a+10), 10:10:40);
bar(15:10:45, cnt, 1, 'FaceColor', [0.5 0.7 0.5], 'EdgeColor', 'k'); grid on;
set(gca, 'XTick', 15:10:45, 'XTickLabel', {'10-19','20-29','30-39','40-49'});
xlabel('Execution time (s)'); ylabel('Frequency'); title('Histogram'); ylim([0 14]);
print('-dpng', '-r130', 'images/Q6_stem_leaf_central_tendency.png');
