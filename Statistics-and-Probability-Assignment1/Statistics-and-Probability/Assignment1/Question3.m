%% Question 3: Frequency Distribution of a Discrete Variable
clc; clear; close all;

defects = [2 4 3 5 2 6 4 3 5 7 4 2 3 6 5 4 3 8 2 5 6 4 3 5 7 4 2 6 5 3];
n = numel(defects);

vals    = unique(defects);
freq    = arrayfun(@(v) sum(defects == v), vals);
relFreq = freq / n;                    % RF = f / n
cumFreq = cumsum(freq);

fprintf('%8s %10s %10s %10s\n', 'Defects', 'Frequency', 'RelFreq', 'CumFreq');
for i = 1:numel(vals)
    fprintf('%8d %10d %10.4f %10d\n', vals(i), freq(i), relFreq(i), cumFreq(i));
end
fprintf('%8s %10d %10.4f\n', 'Total', sum(freq), sum(relFreq));

modes = vals(freq == max(freq));
fprintf('\nHighest frequency = %d -> Mode = %s\n', max(freq), num2str(modes));
fprintf('Frequencies: %s\n', num2str(freq));

figure('Position', [100 100 900 380]);
subplot(1,2,1);
bar(vals, freq, 'FaceColor', [0.2 0.6 0.5]); grid on;
xlabel('Number of defects per module'); ylabel('Frequency');
title('Bar chart of defects (30 modules)'); ylim([0 8]);
for i = 1:numel(vals), text(vals(i), freq(i)+0.15, num2str(freq(i)), 'HorizontalAlignment', 'center'); end
subplot(1,2,2);
stairs([vals vals(end)+1], [cumFreq cumFreq(end)], 'LineWidth', 1.6); grid on; ylim([0 32]); xlim([1 9]);
xlabel('Number of defects'); ylabel('Cumulative frequency');
title('Cumulative frequency');
print('-dpng', '-r130', 'images/Q3_discrete_frequency.png');
