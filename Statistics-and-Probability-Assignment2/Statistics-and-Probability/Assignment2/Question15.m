%% Question 15 (Lecture 15): Simple Linear Regression, Standard Error of Estimate, Correlation
clc; clear; close all;

x = 1:10;
y = [35 42 48 55 57 66 70 74 83 88];
n = numel(x);

p  = polyfit(x, y, 1);                 % p(1) = slope b, p(2) = intercept a
yh = polyval(p, x);                    % fitted values
R  = corrcoef(x, y);   r = R(1,2);     % correlation coefficient
Se = sqrt(sum((y - yh).^2)/(n-2));     % standard error of estimate
pred = polyval(p, 7.5);                % prediction at x = 7.5

fprintf('Y = %.4f + %.4f X\n', p(2), p(1));
fprintf('r = %.4f, r^2 = %.4f, Se = %.4f, Pred(7.5) = %.2f\n\n', r, r^2, Se, pred);

% ---- step-by-step working (formula method) ----
Sx = sum(x); Sy = sum(y); Sxy = sum(x.*y); Sxx = sum(x.^2); Syy = sum(y.^2);
b = (n*Sxy - Sx*Sy)/(n*Sxx - Sx^2);               % slope
a = mean(y) - b*mean(x);                          % intercept
r_formula = (n*Sxy - Sx*Sy)/sqrt((n*Sxx - Sx^2)*(n*Syy - Sy^2));
fprintf('Sx=%d Sy=%d Sxy=%d Sxx=%d Syy=%d\n', Sx, Sy, Sxy, Sxx, Syy);
fprintf('%4s %4s %8s %8s %8s\n', 'x', 'y', 'yhat', 'resid', 'resid^2');
for i = 1:n, fprintf('%4d %4d %8.2f %8.2f %8.3f\n', x(i), y(i), yh(i), y(i)-yh(i), (y(i)-yh(i))^2); end
fprintf('b = %.4f, a = %.4f, r = %.4f\n', b, a, r_formula);

figure('Position', [100 100 800 420]); plot(x, y, 'o', 'MarkerFaceColor', 'b'); hold on
plot(x, yh, '-', 'LineWidth', 1.5);
for i = 1:n, plot([x(i) x(i)], [y(i) yh(i)], ':', 'Color', [.5 .5 .5]); end
xlabel('Study hours'); ylabel('Marks');
legend('Data', sprintf('Y = %.2f + %.2fX', p(2), p(1)), 'Location', 'northwest');
title(sprintf('Regression line (r = %.4f, Se = %.3f)', r, Se)); grid on
print('-dpng', '-r130', 'images/Q15_regression.png');
