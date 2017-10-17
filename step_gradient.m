function [new_a, new_b] = step_gradient(a, b, data, learning_rate)
    % Get data length
    data_len = size(data)(1);
    
    % Get x and y points from data
    x = data(:, 1);
    y = data(:, 2);
    
    % calculate y from cost function
    y_cost = a * x + b;
    
    % calculate y - y´ which will be used in the gradient descent
    y_error = (y_cost - y);

    % gradiente for a and b (ax + b) define as:
    
    % a = (1/n) * sum(i=1:n){x*[y' - y]}    
    temp = x' * y_error;
    %temp = sum(temp);
    a_temp = (temp)/data_len;
    new_a = a - (learning_rate * a_temp);
    
    % b = (1/n) * sum(i=1:n){[y' - y]}
    b_temp = sum(y_error)/data_len;
    new_b = b - (learning_rate * b_temp);
    
endfunction