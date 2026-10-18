%% Question 1 (Lecture 1): Variables, Measurement Scales and Error of Measurement
% Student: M. Abdullah (FA23-BSE-129) | Subject: Statistics and Probability
clc; clear; close all;

%% ---- Type of variable and scale ----
disp('Weight (kg): continuous quantitative variable, ratio scale');

%% ---- Errors ----
true_w = [10 20 30 40 50 60 70 80];      % true weights (kg)
meas_w = [10.2 19.7 30.4 39.6 50.5 59.4 70.7 79.2];

err     = meas_w - true_w;               % error of measurement
abs_err = abs(err);                      % absolute error
pct_err = abs_err ./ true_w * 100;       % percentage (relative) error

fprintf('\n%6s %6s %9s %8s %9s %8s\n', 'Object', 'True', 'Measured', 'Error', 'AbsError', 'Pct%');
for i = 1:8
    fprintf('%6d %6g %9.1f %+8.1f %9.1f %8.2f\n', i, true_w(i), meas_w(i), err(i), abs_err(i), pct_err(i));
end
fprintf('\nMean absolute error   = %.4f kg\n', mean(abs_err));
fprintf('Mean percentage error = %.4f %%\n', mean(pct_err));
[~, imax] = max(pct_err);
fprintf('Largest percentage error: object %d (%.2f %%)\n', imax, pct_err(imax));

%% ---- Graph ----
figure('Position', [100 100 900 380]);
subplot(1,2,1); bar(err, 'FaceColor', [0.2 0.5 0.8]); title('Error = Measured - True');
xlabel('Object'); ylabel('kg'); grid on
subplot(1,2,2); bar(pct_err, 'FaceColor', [0.85 0.45 0.2]); title('Percentage error');
xlabel('Object'); ylabel('%'); grid on
print('-dpng', '-r130', 'images/Q1_measurement_error.png');
