%% Question 9 (Lecture 9): Geometric Mean, Harmonic Mean and AM-GM-HM Relation
clc; clear; close all;

%% (a) AM, GM, HM
x  = [2 4 8 16 32];
AM = mean(x);
GM = exp(mean(log(x)));          % same as geomean(x) in Statistics Toolbox
HM = numel(x)/sum(1./x);         % same as harmmean(x)

fprintf('%6s %10s %10s\n', 'x', 'ln x', '1/x');
for i = 1:numel(x), fprintf('%6g %10.4f %10.5f\n', x(i), log(x(i)), 1/x(i)); end
fprintf('sum(1/x) = %.5f\n', sum(1./x));
fprintf('AM = %.4f, GM = %.4f, HM = %.4f\n', AM, GM, HM);
fprintf('AM >= GM >= HM ?  %d\n\n', AM >= GM && GM >= HM);

%% (b) Average speed
speeds    = [40 60 80 120];
avg_speed = numel(speeds)/sum(1./speeds);       % 64 km/h
fprintf('Average speed = %.1f km/h (AM would wrongly give %.1f)\n', avg_speed, mean(speeds));

%% Graph
figure('Position', [100 100 600 400]);
bar(1:3, [HM GM AM], 0.5, 'FaceColor', [0.35 0.6 0.85]);
set(gca, 'XTickLabel', {'HM', 'GM', 'AM'});
vals = [HM GM AM];
for i = 1:3, text(i, vals(i)+0.4, sprintf('%.4f', vals(i)), 'HorizontalAlignment', 'center'); end
title('AM >= GM >= HM'); grid on
print('-dpng', '-r130', 'images/Q9_AM_GM_HM.png');
