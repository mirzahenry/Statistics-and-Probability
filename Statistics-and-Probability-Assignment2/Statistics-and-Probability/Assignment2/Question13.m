%% Question 13 (Lecture 13): Box-and-Whisker Plot and Pearson's Coefficient of Skewness
% (uses the helper function qpos.m in this folder)
clc; clear; close all;

x  = [12 15 17 18 20 20 21 22 23 25 26 28 30 32 60];
m  = mean(x);  md = median(x);  mo = mode(x);  s = std(x,1);
Sk1 = (m - mo)/s;                 % Pearson 1st coefficient
Sk2 = 3*(m - md)/s;               % Pearson 2nd coefficient
fprintf('Mean=%.2f Median=%g Mode=%g SD=%.3f\n', m, md, mo, s);
fprintf('Sk1=%.4f  Sk2=%.4f  -> positively skewed\n', Sk1, Sk2);

Q1 = qpos(x,.25);  Q3 = qpos(x,.75);  IQR = Q3 - Q1;
lowF = Q1 - 1.5*IQR;  upF = Q3 + 1.5*IQR;
outliers = x(x < lowF | x > upF);
fprintf('Q1=%g Q3=%g IQR=%g  fences: %g and %g\n', Q1, Q3, IQR, lowF, upF);
fprintf('Outlier(s): %s\n', num2str(outliers));

% ---- step-by-step working ----
dev = x - m;
fprintf('sum dev^2 = %.2f, variance = %.2f\n', sum(dev.^2), sum(dev.^2)/numel(x));

%% Box-and-whisker plot (drawn manually so no toolbox is needed)
inside = x(x >= lowF & x <= upF);
wlo = min(inside); whi = max(inside);
figure('Position', [100 100 850 330]); hold on
fill([Q1 Q3 Q3 Q1], [0.7 0.7 1.3 1.3], [0.62 0.76 0.90]);
plot([md md], [0.7 1.3], 'k', 'LineWidth', 2);
plot([wlo Q1], [1 1], 'k'); plot([Q3 whi], [1 1], 'k');
plot([wlo wlo], [0.85 1.15], 'k'); plot([whi whi], [0.85 1.15], 'k');
plot(outliers, ones(size(outliers)), 'r+', 'MarkerSize', 10, 'LineWidth', 1.6);
plot(m, 1, 'g^', 'MarkerFaceColor', 'g');
ylim([0.4 1.6]); set(gca, 'YTick', []); grid on
xlabel('Age (years)'); title('Box-and-whisker plot (green = mean, red + = outlier)');
print('-dpng', '-r130', 'images/Q13_boxplot_skewness.png');
