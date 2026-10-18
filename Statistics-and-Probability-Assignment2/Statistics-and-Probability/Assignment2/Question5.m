%% Question 5 (Lecture 5): Frequency Curves and Cumulative Frequency (Ogive)
clc; clear; close all;

edges = 20:10:80;  f = [4 9 16 24 12 5];
n   = sum(f);  cf = [0 cumsum(f)];
mid = (edges(1:end-1) + edges(2:end))/2;

fprintf('Less than : %s\n', num2str(edges(2:end)));
fprintf('Cum. f    : %s\n', num2str(cf(2:end)));

figure('Position', [100 100 950 400]);
subplot(1,2,1)                                   % frequency polygon
plot([mid(1)-10, mid, mid(end)+10], [0 f 0], '-o', 'LineWidth', 1.5);
xlabel('Class mid-point'); ylabel('Frequency'); title('Frequency polygon'); grid on

subplot(1,2,2)                                   % less-than ogive
plot(edges, cf, '-o', 'LineWidth', 1.5); hold on
med_graph = interp1(cf, edges, n/2);             % median read from the ogive
plot([edges(1) med_graph med_graph], [n/2 n/2 0], 'k--');
text(med_graph+2, n/2-10, sprintf('Median = %.1f', med_graph));
xlabel('Upper class boundary'); ylabel('Cumulative frequency');
title('Less-than ogive'); grid on

i = find(cf(2:end) >= n/2, 1);                   % median class
h = edges(2) - edges(1);
med_formula = edges(i) + h/f(i)*(n/2 - cf(i));   % 52.5
fprintf('\nMedian from ogive   = %.2f\n', med_graph);
fprintf('Median from formula = %.2f  (class %d-%d)\n', med_formula, edges(i), edges(i+1));
print('-dpng', '-r130', 'images/Q5_frequency_curves.png');
