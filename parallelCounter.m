n=30;
parForTime = zeros(n,1);
builtinSumTime = zeros(n,1); 
RunID = transpose(1:n);

for i = 1:n
    X = randi([1 10], 100);
    tic;sm1 = parCountOnes(X);parForTime(i)= toc;
    tic;sm2 = builtinSum(X);builtinSumTime(i)= toc;
end

% Write results to csv
BuiltInSumTime = builtinSumTime*1000;
averageBuiltinTime = mean(builtinSumTime*1000);
fprintf("Average built-in time: %d\n", averageBuiltinTime);
ParForSumTime = parForTime*1000; 
averageParForTime = mean(parForTime*1000);
fprintf("Average parfor time: %d\n", averageParForTime);
executionTimesTable = table(RunID, BuiltInSumTime,ParForSumTime);
writetable(executionTimesTable,"builtinsum_vs_parforsum.csv",'Delimiter'," ");

function builtsum = builtinSum(matrix)
   builtsum = sum(matrix(:) == 1);  % in-built func to validate num_1s 
end

function parasum = parCountOnes(matrix)
    num_1s = 0;     
    parfor i = 1:numel(matrix)
        if matrix(i) == 1
            num_1s = num_1s + 1;
        end
    end
    parasum = num_1s;
end