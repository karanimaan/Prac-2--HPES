% Uses the built-in sort function to sort column entries of a matrix in 
% decending order. This speedup of the built-in sort function is determined
% from comparing it to the sequential implementation of the bubble sort
% algorithm. 

function sorted_matrix = builtinSort(matrix)
    N = size(matrix, 2);%number of columns
    for col_j = 1:N
        %sort each column
        matrix(:,col_j) = sort(matrix(:,col_j));
    end
    sorted_matrix = matrix;
end