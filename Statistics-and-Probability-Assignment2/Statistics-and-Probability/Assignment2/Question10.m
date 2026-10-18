%% Question 10 (Lecture 10): Range, Quartile Deviation and their Coefficients
% (uses the helper function qpos.m in this folder: (n+1)p rule of the lecture)
clc; clear; close all;

x  = [12 15 18 22 25 27 30 34 38 41 45];
R  = max(x) - min(x);               coefR  = (max(x)-min(x))/(max(x)+min(x));
Q1 = qpos(x, 0.25);  Q3 = qpos(x, 0.75);
QD = (Q3-Q1)/2;                     coefQD = (Q3-Q1)/(Q3+Q1);

fprintf('Range = %g, Coefficient of range = %.4f\n', R, coefR);
fprintf('Q1 = %g, Q3 = %g\n', Q1, Q3);
fprintf('QD = %g, Coefficient of QD = %.4f\n', QD, coefQD);

figure('Position', [100 100 900 320]); hold on
fill([Q1 Q3 Q3 Q1], [-.1 -.1 .1 .1], [.97 .7 .45], 'FaceAlpha', .4);
plot(x, zeros(size(x)), 'o', 'MarkerFaceColor', 'b');
plot([min(x) max(x)], [.15 .15], 'k-');             % range arrow
plot(min(x), .15, 'k<', 'MarkerFaceColor', 'k'); plot(max(x), .15, 'k>', 'MarkerFaceColor', 'k');
text(mean(x), .19, sprintf('Range = %g', R), 'HorizontalAlignment', 'center');
text((Q1+Q3)/2, -.15, sprintf('Q1 = %g to Q3 = %g  (QD = %g)', Q1, Q3, QD), 'HorizontalAlignment', 'center');
ylim([-.25 .3]); set(gca, 'YTick', []); xlabel('Daily sales (Rs. thousand)');
title('Range and quartile deviation'); grid on
print('-dpng', '-r130', 'images/Q10_range_quartile_deviation.png');
