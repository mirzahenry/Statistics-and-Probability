%% Question 2 (Lecture 2): Data Collection and Sampling
clc; clear; close all;
try, rng(7); catch, rand('twister', 7); end   % fix the seed (repeatable result)

N = 60; n = 6;

%% (a) Simple random sampling
srs = sort(randperm(N, n));
disp('Simple random sample (student numbers):'); disp(srs);

%% (b) Systematic sampling:  k = N/n, random start = 4
k = N/n;  start = 4;
sys_idx = start:k:N;
fprintf('k = %d, start = %d\n', k, start);
disp('Systematic sample:'); disp(sys_idx);          % 4 14 24 34 44 54

%% Graph: where the selected students fall in the list 1..N
figure('Position', [100 100 1000 380]); hold on;
for s = 1:N, plot([s s], [0 3], 'Color', [0.88 0.88 0.88]); end
plot(srs,     2*ones(size(srs)),     'o', 'MarkerSize', 9, 'MarkerFaceColor', [0.2 0.5 0.8], 'MarkerEdgeColor', [0.2 0.5 0.8]);
plot(sys_idx, 1*ones(size(sys_idx)), 'd', 'MarkerSize', 9, 'MarkerFaceColor', [0.77 0.35 0.07], 'MarkerEdgeColor', [0.77 0.35 0.07]);
set(gca, 'YTick', [1 2], 'YTickLabel', {'Systematic', 'Simple random'});
ylim([0 3]); xlim([0 N+1]); grid on;
xlabel('Student serial number');
title(sprintf('Selected students: n = %d out of N = %d  (systematic: k = %d, start = %d)', n, N, k, start));
print('-dpng', '-r130', 'images/Q2_sampling.png');
