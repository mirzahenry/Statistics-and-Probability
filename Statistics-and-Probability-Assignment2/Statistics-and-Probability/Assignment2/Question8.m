%% Question 8 (Lecture 8): Grouped Median, Quantiles, Empirical Relation, Graphic Location
% (uses the helper function grpq.m in this folder)
clc; clear; close all;

edges = 10:10:70;  f = [5 12 25 30 18 10];
n = sum(f);  h = 10;  cf = cumsum(f);
mid   = (edges(1:end-1) + edges(2:end))/2;
meanx = sum(f.*mid)/n;

Q1 = grpq(0.25, edges, f);  Q2 = grpq(0.50, edges, f);
Q3 = grpq(0.75, edges, f);  D9 = grpq(0.90, edges, f);

[fm, im] = max(f);                               % modal class
modex = edges(im) + (fm-f(im-1))/((fm-f(im-1)) + (fm-f(im+1)))*h;

fprintf('%6s %6s %5s %5s %6s %6s\n', 'Lower', 'Upper', 'f', 'Mid', 'fx', 'CumF');
for i = 1:numel(f)
    fprintf('%6d %6d %5d %5g %6g %6d\n', edges(i), edges(i+1), f(i), mid(i), f(i)*mid(i), cf(i));
end
fprintf('sum(fx) = %d, n = %d\n\n', sum(f.*mid), n);
fprintf('Mean=%.2f Q1=%.2f Med=%.2f Q3=%.2f D9=%.2f Mode=%.2f\n', meanx, Q1, Q2, Q3, D9, modex);
fprintf('3*Median - 2*Mean = %.2f\n', 3*Q2 - 2*meanx);

figure('Position', [100 100 800 420]); plot(edges, [0 cf], '-o', 'LineWidth', 1.5); hold on   % ogive
qs = [Q1 Q2 Q3];  ps = [.25 .5 .75]*n;
for j = 1:3
    plot([edges(1) qs(j) qs(j)], [ps(j) ps(j) 0], '--');
    text(qs(j)+1, ps(j)-6, sprintf('Q%d = %.2f', j, qs(j)));
end
xlabel('Upper class boundary'); ylabel('Cumulative frequency');
title('Ogive with graphic location of quartiles'); grid on
print('-dpng', '-r130', 'images/Q8_quantiles_ogive.png');
