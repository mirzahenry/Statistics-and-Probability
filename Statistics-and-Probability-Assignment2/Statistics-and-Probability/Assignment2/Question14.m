%% Question 14 (Lecture 14): Moments, Sheppard's Corrections, Skewness and Kurtosis
% (uses the helper function grpq.m in this folder)
clc; clear; close all;

edges = 20:10:90;  f = [10 22 30 20 10 5 3];
n = sum(f);  h = 10;
mid = (edges(1:end-1) + edges(2:end))/2;
mu  = sum(f.*mid)/n;                              % 47.5
d   = mid - mu;
m   = arrayfun(@(r) sum(f.*d.^r)/n, 1:4);         % m1..m4 (uncorrected)

m2c = m(2) - h^2/12;                              % Sheppard's corrections
m3c = m(3);
m4c = m(4) - (h^2/2)*m(2) + (7/240)*h^4;

b1 = m3c^2/m2c^3;   b2 = m4c/m2c^2;               % moment ratios
g1 = sqrt(b1);      g2 = b2 - 3;

fprintf('%6s %4s %7s %10s %11s %13s\n', 'Mid', 'f', 'd', 'fd^2', 'fd^3', 'fd^4');
for i = 1:numel(f)
    fprintf('%6g %4d %7.1f %10.2f %11.2f %13.2f\n', mid(i), f(i), d(i), f(i)*d(i)^2, f(i)*d(i)^3, f(i)*d(i)^4);
end
fprintf('Cumulative frequencies: %s\n', num2str(cumsum(f)));
fprintf('\nMean = %.2f\n', mu);
fprintf('m1=%.2f m2=%.2f m3=%.2f m4=%.2f\n', m);
fprintf('Corrected: m2=%.4f m3=%.2f m4=%.2f\n', m2c, m3c, m4c);
fprintf('b1=%.4f b2=%.4f g1=%.4f g2=%.4f\n', b1, b2, g1, g2);

Q1 = grpq(.25,edges,f); Q2 = grpq(.5,edges,f); Q3 = grpq(.75,edges,f);
P10 = grpq(.10,edges,f); P90 = grpq(.90,edges,f);
bowley = (Q3 - 2*Q2 + Q1)/(Q3 - Q1);
kappa  = ((Q3 - Q1)/2)/(P90 - P10);
fprintf('Q1=%.2f Q2=%.2f Q3=%.2f P10=%.2f P90=%.2f\n', Q1, Q2, Q3, P10, P90);
fprintf('Bowley skewness = %.4f\n', bowley);              % 0.0670
fprintf('Percentile coefficient of kurtosis = %.4f\n', kappa);   % 0.2590

figure('Position', [100 100 800 400]);
bar(mid, f, 1, 'FaceColor', [.62 .76 .90]); hold on
xs = linspace(15, 95, 200); s = sqrt(m2c);
plot(xs, exp(-(xs-mu).^2/(2*s^2))/(s*sqrt(2*pi))*n*h, 'LineWidth', 1.5);   % normal curve (no toolbox)
xlabel('Marks'); ylabel('Frequency'); legend('Histogram', 'Normal curve');
title('Histogram vs normal curve'); grid on
print('-dpng', '-r130', 'images/Q14_moments_skewness_kurtosis.png');
