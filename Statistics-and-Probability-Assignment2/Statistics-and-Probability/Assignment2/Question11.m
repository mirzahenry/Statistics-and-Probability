%% Question 11 (Lecture 11): Mean Deviation, SD, Variance and Coefficient of Variation
clc; clear; close all;

A = [45 50 38 60 52 47 55 41];
B = [20 85 10 95 35 70 15 90];
f = @(x) [mean(x), mean(abs(x-mean(x))), var(x,1), std(x,1), 100*std(x,1)/mean(x)];
R = [f(A); f(B)];

fprintf('%-12s %10s %10s\n', '', 'A', 'B');
lab = {'Mean', 'MeanDev', 'Variance', 'StdDev', 'CV (%)'};
for i = 1:5, fprintf('%-12s %10.4f %10.4f\n', lab{i}, R(1,i), R(2,i)); end
if R(1,5) < R(2,5), fprintf('\nBatsman A is more consistent (smaller CV).\n');
else, fprintf('\nBatsman B is more consistent (smaller CV).\n'); end

% ---- step-by-step working (batsman A) ----
dev = A - mean(A);
fprintf('\n%6s %12s %9s %9s\n', 'x', 'x - mean', '|dev|', 'dev^2');
for i = 1:numel(A), fprintf('%6d %12.2f %9.2f %9.2f\n', A(i), dev(i), abs(dev(i)), dev(i)^2); end
fprintf('sum|dev| = %.2f, sum dev^2 = %.2f\n', sum(abs(dev)), sum(dev.^2));

figure('Position', [100 100 800 400]);
plot(1:8, A, '-o', 'LineWidth', 1.5); hold on
plot(1:8, B, '-s', 'LineWidth', 1.5);
xlabel('Innings'); ylabel('Runs'); legend('Batsman A', 'Batsman B');
title('Consistency comparison'); grid on
print('-dpng', '-r130', 'images/Q11_consistency_comparison.png');
