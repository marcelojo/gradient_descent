% Gradient descent example for linear regression
clc;
clf;
% Define learning rate step
learning_rate = 0.00001;

% Define start point a, b
a = 0;
b = 0;

% Define error tolerance to stop
error_tolerance = 50;

% Define max interation
max_interation = 1000;

% Read data
data = dlmread('data.csv', ',', 2, 0);

% Start error greater than tolerance
error = 1;

error_plot = zeros(max_interation,1);

% Loop 
for i = 1:max_interation
    error = norm(calculate_error(a, b, data));
    error_plot(i) = error;
    % If we got an error smaller than the tolerance, stop
    if error <= error_tolerance
        break;
    endif      
    
    [a b] = step_gradient(a, b, data, learning_rate);
    param(i, :) = [a b];
end

% Plot Gradient descent and final results
figure(1);
scatter(data(:,1), data(:, 2));
hold on;
% First 5 steps ...
x = ones(max_interation, 1) * [20, 80];
y = param(1:max_interation, 1) .* x + param(1:max_interation, 2);

for j = 1:max_interation/100:max_interation
    plot(x(j,:), y(j,:), 'b');
    hold on;
end

% Plot error vs iteration
figure(2);
plot(error_plot);

% Plot and print final data
figure(3);
scatter(data(:,1), data(:, 2));
hold on;
plot(x(i,:), y(i,:), 'b');

a
b
error
i




