function error = calculate_error (a, b, data)
    
    % linear regression y = ax + b
    % The cost function is the mean square error
    % Error = 1/2n * sum(i=1:n)[y' - y]^2
    % where y is the real value and y´ is the estimation value

    x = data(:, 1);
    y = data(:, 2);
    data_len = size(data)(1);    
    
    % create vector and calculate all points
    y_cost = a * x + b;
    y_error = y_cost - y;
    error = (y_error' * y_error)/(2 * data_len);
endfunction