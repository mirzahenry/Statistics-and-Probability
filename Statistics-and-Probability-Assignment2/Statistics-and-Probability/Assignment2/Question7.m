%% Question 7 (Lecture 7): Arithmetic Mean, Weighted Mean and Median
clc; clear; close all;

%% (a) Weighted mean
scores  = [72 65 80 90];
weights = [10 20 30 40];
wmean = sum(scores.*weights)/sum(weights);     % 80.2
smean = mean(scores);                          % 76.75
fprintf('%-12s %6s %6s %6s\n', 'Component', 'x', 'w', 'wx');
nm = {'Quiz', 'Assignments', 'Midterm', 'Final'};
for i = 1:4, fprintf('%-12s %6d %6d %6d\n', nm{i}, scores(i), weights(i), scores(i)*weights(i)); end
fprintf('sum(wx) = %d, sum(w) = %d\n', sum(scores.*weights), sum(weights));
fprintf('Weighted mean = %.2f, Simple mean = %.2f\n\n', wmean, smean);

%% (b) Mean and median
x = [12 15 11 18 14 20 16 13 17];
fprintf('Ordered data: %s\n', num2str(sort(x)));
fprintf('Mean = %.2f, Median = %g\n', mean(x), median(x));

%% Graph
figure('Position', [100 100 800 400]);
bar(scores, 'FaceColor', [0.35 0.55 0.85]); hold on
plot([0.5 4.5], [smean smean], '--', 'LineWidth', 1.5);
plot([0.5 4.5], [wmean wmean], '-',  'LineWidth', 1.5);
set(gca, 'XTickLabel', {'Quiz', 'Assign.', 'Midterm', 'Final'});
ylabel('Marks (%)'); ylim([0 100]);
legend('Marks', 'Simple mean', 'Weighted mean', 'Location', 'southeast');
title('Weighted vs simple mean'); grid on
print('-dpng', '-r130', 'images/Q7_weighted_mean.png');
