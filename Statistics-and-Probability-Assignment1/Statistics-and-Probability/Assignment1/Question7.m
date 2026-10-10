%% Question 7: Arithmetic Mean, Weighted Mean and Median
clc; clear; close all;

marks   = [78 84 91 76];
weights = [0.30 0.25 0.25 0.20];                     % 30%, 25%, 25%, 20%
courses = {'Programming', 'Statistics', 'Soft. Eng.', 'Database'};

simpleMean   = mean(marks);                          % sum(x)/n
weightedMean = sum(weights .* marks) / sum(weights); % sum(w*x)/sum(w)
fprintf('Arithmetic mean = %.2f\nWeighted mean   = %.2f\n', simpleMean, weightedMean);

coding = [62 70 74 74 79 81 85 88 90 95];
n = numel(coding);
med = (coding(n/2) + coding(n/2+1)) / 2;             % 5th and 6th of 10 values
u = unique(coding); c = arrayfun(@(v) sum(coding == v), u);
moc = u(c == max(c));
fprintf('Coding test median = %g\nCoding test mode   = %s (occurs %d times)\n', med, num2str(moc), max(c));

figure('Position', [100 100 950 400]);
bar(marks, 'FaceColor', [0.35 0.55 0.85]); hold on;
h1 = plot([0.5 4.5], [simpleMean simpleMean], 'g--', 'LineWidth', 1.8);
h2 = plot([0.5 4.5], [weightedMean weightedMean], 'r-.', 'LineWidth', 1.8);
for i = 1:4, text(i, marks(i)+1.5, num2str(marks(i)), 'HorizontalAlignment', 'center'); end
set(gca, 'XTickLabel', courses); ylim([0 100]); grid on;
xlabel('Course'); ylabel('Marks'); title('Course marks');
legend([h1 h2], {sprintf('Simple mean = %.2f', simpleMean), sprintf('Weighted mean = %.2f', weightedMean)}, 'Location', 'southeast');
print('-dpng', '-r130', 'images/Q7_course_marks.png');
