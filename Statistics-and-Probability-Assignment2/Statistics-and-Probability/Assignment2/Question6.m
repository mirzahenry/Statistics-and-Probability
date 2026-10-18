%% Question 6 (Lecture 6): Stem-and-Leaf Display and the Mode
clc; clear; close all;

data   = [23 31 45 27 38 41 52 29 33 38 47 25 38 61 34 42 36 29 55 38 44 30 26 49 35];
data   = sort(data);
stems  = floor(data/10);
leaves = mod(data, 10);

disp('Stem-and-leaf display   (Key: 3 | 8 = 38)');
lines = {};
for s = min(stems):max(stems)
    lines{end+1} = sprintf('%d | %s', s, num2str(leaves(stems == s)));
    disp(lines{end});
end

m = mode(data);                          % mode = 38
fprintf('Mode = %d (occurs %d times)\n', m, sum(data == m));

%% Graph: the display itself + number of leaves per stem
figure('Position', [100 100 900 380]);
subplot(1,2,1); axis off; hold on;
text(0.1, 0.95, 'Stem-and-leaf display (Key: 3 | 8 = 38)', 'FontWeight', 'bold');
for i = 1:numel(lines), text(0.1, 0.85 - 0.12*(i-1), lines{i}, 'FontName', 'FixedWidth', 'FontSize', 12); end
subplot(1,2,2);
cnt = arrayfun(@(s) sum(stems == s), min(stems):max(stems));
bar(min(stems):max(stems), cnt, 0.6, 'FaceColor', [0.5 0.7 0.5]); grid on;
xlabel('Stem (tens)'); ylabel('Number of leaves'); title(sprintf('Leaves per stem (mode = %d)', m));
print('-dpng', '-r130', 'images/Q6_stem_leaf_mode.png');
