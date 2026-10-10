%% Question 1: Types of Variables, Measurement Scales and Measurement Error
% Student: M. Abdullah (FA23-BSE-129) | Subject: Statistics and Probability
clc; clear; close all;

%% ---- A. Classification of variables (manual work, from the assignment) ----
vars   = {'Project ID'; 'Programming Language'; 'Number of Developers'; ...
          'Project Type'; 'Development Time'; 'Customer Satisfaction'};
vtype  = {'Qualitative'; 'Qualitative'; 'Quantitative (Discrete)'; ...
          'Qualitative'; 'Quantitative (Continuous)'; 'Qualitative (Ordinal rating)'};
vscale = {'Nominal'; 'Nominal'; 'Ratio'; 'Nominal'; 'Ratio'; 'Ordinal'};
fprintf('%-24s %-30s %s\n', 'Variable', 'Type', 'Scale');
fprintf('%s\n', repmat('-', 1, 70));
for i = 1:numel(vars)
    fprintf('%-24s %-30s %s\n', vars{i}, vtype{i}, vscale{i});
end

%% ---- B. Measurement error ----
trueVal = 5.0;                         % true value (months)
err     = [0.1 0 0.3 -0.1 0.2];        % ME = observed - true
obs     = trueVal + err;               % observed development times
absErr  = abs(err);
MAE     = mean(absErr);

fprintf('\nTrue value            : %.1f months\n', trueVal);
fprintf('Observed values       : %s\n', num2str(obs));
fprintf('Errors (obs - true)   : %s\n', num2str(err));
fprintf('Absolute errors       : %s\n', num2str(absErr));
fprintf('Mean absolute error   : %.2f months\n', MAE);
fprintf('Manual result 0.14    : %s\n', ifelse(abs(MAE-0.14) < 1e-10, 'AGREES', 'DISAGREES'));

%% ---- C. Graph ----
figure('Position', [100 100 900 380]);
subplot(1,2,1);
plot(1:5, obs, '-o', 'LineWidth', 1.6, 'MarkerFaceColor', [0.2 0.5 0.8]); hold on;
plot([1 5], [trueVal trueVal], 'r--', 'LineWidth', 1.4);
grid on; xlabel('Observation'); ylabel('Development time (months)');
title('Observed values vs true value'); legend('Observed', 'True value (5.0)', 'Location', 'northwest');
subplot(1,2,2);
bar(1:5, absErr, 'FaceColor', [0.85 0.45 0.2]); hold on;
plot([0.5 5.5], [MAE MAE], 'k--', 'LineWidth', 1.4);
grid on; xlabel('Observation'); ylabel('|Error| (months)');
title(sprintf('Absolute errors (MAE = %.2f)', MAE)); legend('|Error|', 'MAE', 'Location', 'northwest');
print('-dpng', '-r130', 'images/Q1_measurement_error.png');

function out = ifelse(c, a, b)
if c, out = a; else, out = b; end
end
