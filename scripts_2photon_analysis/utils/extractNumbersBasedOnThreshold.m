function extracted_numbers = extractNumbersBasedOnThreshold(input_array, threshold, threshold1, threshold2)
    % Initialize the output array
    extracted_numbers = [];
    
    % Check the first element against threshold1
    if length(input_array) > 1 && abs(input_array(2) - input_array(1)) > threshold && input_array(1) > threshold1
        extracted_numbers = [input_array(1)];
    end
    
    % Iterate through the array starting from the second element to the second-to-last element
    for i = 2:length(input_array)-1
        % Calculate the difference with the previous and next elements
        diff_prev = abs(input_array(i) - input_array(i-1));
        diff_next = abs(input_array(i+1) - input_array(i));
        
        % Check if both differences are larger than the threshold
        if diff_prev > threshold && diff_next > threshold
            extracted_numbers = [extracted_numbers, input_array(i)];
        end
    end
    
    % Optionally, check the last element against threshold2
    if length(input_array) > 1 && abs(input_array(end) - input_array(end-1)) > threshold && input_array(end) < threshold2
        extracted_numbers = [extracted_numbers, input_array(end)];
    end
end
