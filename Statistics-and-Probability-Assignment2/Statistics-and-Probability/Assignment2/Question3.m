%% Question 3 (Lecture 3): Frequency Distribution of a Discrete Variable
clc; clear; close all;

d = [0 1 2 1 0 3 2 1 1 4 2 0 1 2 3 1 2 2 0 1 3 2 1 0 2 1 4 1 2 3];
n = numel(d);

[v, ~, ic] = unique(d);           % distinct values
f   = accumarray(ic(:), 1)';      % frequencies
rf  = f/n;  pct = 100*rf;  cf = cumsum(f);

fprintf('%8s %6s %9s %9s %8s\n', 'Defects', 'f', 'RelFreq', 'Percent', 'CumFreq');
for i = 1:numel(v)
    fprintf('%8d %6d %9.4f %9.2f %8d\n', v(i), f(i), rf(i), pct(i), cf(i));
end
fprintf('%8s %6d %9.4f\n', 'Total', sum(f), sum(rf));
fprintf('\nMost common number of defects = %d (%d samples)\n', v(f == max(f)), max(f));
fprintf('At most 2 defects: %d samples = %.0f %%\n', cf(v == 2), 100*cf(v == 2)/n);

figure('Position', [100 100 900 380]);
subplot(1,2,1)
bar(v, f, 0.4, 'FaceColor', [0.2 0.6 0.5]); xlabel('Defects'); ylabel('Frequency');
title('Bar chart'); grid on
subplot(1,2,2)
stairs(v, cumsum(rf), 'LineWidth', 1.5); hold on
plot(v, cumsum(rf), 'o');
xlabel('Defects'); title('Cumulative relative frequency'); grid on
print('-dpng', '-r130', 'images/Q3_discrete_frequency.png');
