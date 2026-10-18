%% Question 12 (Lecture 12): Chebyshev's Inequality, Empirical Rule, Five-Number Summary
% (uses the helper function qpos.m in this folder)
clc; clear; close all;

mu = 60; sigma = 10;
k    = [1 1.5 2 2.5 3];
cheb = (1 - 1./k.^2)*100;                 % Chebyshev lower bound (%)
emp  = erf(k/sqrt(2))*100;                % normal coverage (%) - no toolbox needed

fprintf('%5s %12s %10s\n', 'k', 'Chebyshev', 'Normal');
for i = 1:numel(k), fprintf('%5.1f %11.2f%% %9.2f%%\n', k(i), cheb(i), emp(i)); end
fprintf('Mean +/- 2SD: %g to %g\n', mu-2*sigma, mu+2*sigma);
fprintf('Mean +/- 3SD: %g to %g\n', mu-3*sigma, mu+3*sigma);

x = [35 42 48 51 55 58 60 62 65 68 72 75 80 88 95];
five = [min(x) qpos(x,.25) median(x) qpos(x,.75) max(x)];
fprintf('\nFive-number summary: %s\n', num2str(five));      % 35 51 62 75 95

figure('Position', [100 100 800 400]);
kk = linspace(1, 4, 100);
plot(kk, (1-1./kk.^2)*100, kk, erf(kk/sqrt(2))*100, 'LineWidth', 1.5);
xlabel('k'); ylabel('% within k SD'); grid on
legend('Chebyshev lower bound', 'Normal (Empirical rule)', 'Location', 'southeast');
title('Chebyshev vs Empirical rule');
print('-dpng', '-r130', 'images/Q12_chebyshev_empirical.png');
