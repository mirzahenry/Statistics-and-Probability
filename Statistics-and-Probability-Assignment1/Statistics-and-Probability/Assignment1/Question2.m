%% Question 2: Data Collection and Sampling
clc; clear; close all;
try, rng(1); catch, rand('twister', 1); end   % reproducible results

N        = 240;                  % population (students)
n        = 24;                   % sample size
sections = [60 50 70 60];        % sections A, B, C, D
names    = 'ABCD';

%% 1) Simple random sampling
srs = sort(randperm(N, n));
disp('Simple random sample (IDs):'); disp(srs);

%% 2) Stratified (proportional) sampling:  n_i = n * N_i / N
nh = n * sections / N;
fprintf('Proportional sizes (A,B,C,D) = %s  (total = %d)\n', num2str(nh), sum(nh));
last  = cumsum(sections);
first = [1, last(1:end-1) + 1];
strat = [];
for s = 1:4
    ids  = first(s):last(s);
    pick = sort(ids(randperm(numel(ids), nh(s))));
    fprintf('Section %c (IDs %3d-%3d) -> %d students: %s\n', names(s), first(s), last(s), nh(s), num2str(pick));
    strat = [strat pick];
end

%% 3) Systematic sampling:  k = N/n, random start (start = 4 as in the manual work)
k     = N / n;
start = 4;
sysS  = start:k:N;
fprintf('\nk = %d, start = %d -> %d students\n', k, start, numel(sysS)); disp(sysS);

%% Graph: where the three samples fall in the population 1..240
figure('Position', [100 100 1000 420]); hold on;
plot(srs,   1*ones(size(srs)),   'o', 'MarkerFaceColor', [0.2 0.5 0.8], 'MarkerEdgeColor', [0.2 0.5 0.8]);
plot(strat, 2*ones(size(strat)), 's', 'MarkerFaceColor', [0.2 0.6 0.4], 'MarkerEdgeColor', [0.2 0.6 0.4]);
plot(sysS,  3*ones(size(sysS)),  'd', 'MarkerFaceColor', [0.85 0.4 0.2], 'MarkerEdgeColor', [0.85 0.4 0.2]);
for b = last(1:end-1)+0.5, plot([b b], [0.4 3.6], 'k:'); end
set(gca, 'YTick', 1:3, 'YTickLabel', {'Simple random', 'Stratified', 'Systematic'});
ylim([0.4 3.6]); xlim([0 N+1]); grid on;
xlabel('Student ID (dotted lines separate sections A | B | C | D)');
title('Selected students: 24 out of 240');
print('-dpng', '-r130', 'images/Q2_sampling.png');
