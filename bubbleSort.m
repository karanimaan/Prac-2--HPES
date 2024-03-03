function sorted_matrix = bubbleSort(matrix)
    % Loop through each column of the matrix
    for col = 1:size(matrix, 1)
        % Apply bubble sort to the current column
        for i = 1:size(matrix, 1)-1
            for j = 1:size(matrix, 1)-i
                if matrix(j, col) > matrix(j+1, col)
                    % Swap elements
                    temp = matrix(j, col);
                    matrix(j, col) = matrix(j+1, col);
                    matrix(j+1, col) = temp;
                end
            end
        end
    end

    % Assign the sorted matrix to the output variable
    sorted_matrix = matrix;
end