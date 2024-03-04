% Uses spmd to perform bubble sort algorithm on different workers.
% Program divides columns equally among threads based on the labindex
% of the worker thread.

function sorted_matrix = spmdBubbleSort(matrix)
    p = parpool('local',4);
    N = size(matrix, 2); %number of columns
    numW = p.NumWorkers;
    
    spmd
          % select the index of the column to start sorting from
          startColumn = ceil(N/numW)*(labindex-1) + 1; 
          % select the last index of the column we want to sort
          endColumn = startColumn + ceil(N/numW); 
          
          % case where the matrix has an odd number of columns, last index
          % may be off slightly due to rounding
          if labindex == 4 && endColumn ~= N
              endColumn = N;
          end

          % slice out the appropriate number of columns to sort
          m_sliced = matrix(:,startColumn:endColumn); %divide matrix into 4 parts
          N_s = size(m_sliced,2);%number of columns in sliced portion
          M_s = size(m_sliced,1);%number of rows in sliced portion
          for col_j = 1:N_s %for each column
             for k = 1:M_s-1 %for each row in each column
                 for l = 1:M_s-k %for each item
                    if m_sliced(l, col_j) > m_sliced(l+1,col_j)
                     %Swap items
                     temp = m_sliced(l,col_j);
                     m_sliced(l,col_j) = m_sliced(l+1, col_j);
                     m_sliced(l+1, col_j) = temp;
                    end
                 end
             end
          end
          sorted_matrix = gather(m_sliced);
%           disp(m_sliced);
    end
    p.delete;
end

