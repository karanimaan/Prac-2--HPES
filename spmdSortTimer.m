n=30;
builtinTime = zeros(n,1);
bubblesortTime = zeros(n,1); 
RunID = transpose(1:n);

%measure run time for sorting algorithms n times
for i = 1:n
    mtrx = rand(200,200);
    tic;smtrx2 = bubbleSort(mtrx);bubblesortTime(i)=toc;
    tic;smtrx1 = spmdBubbleSort(mtrx);builtinTime(i)=toc;
end

% Write results to csv
SpmdSortTime = builtinTime;
BubbleSortTime = bubblesortTime; 
speedupval = bubblesortTime./builtinTime;
Speedup = speedupval;
speeduptable = table(RunID, SpmdSortTime, BubbleSortTime, Speedup);
writetable(speeduptable,"spmd_vs_bubblesort200.csv",'Delimiter'," ");