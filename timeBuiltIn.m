n=30;
builtinTime = zeros(n,1);
bubblesortTime = zeros(n,1); 
RunID = transpose(1:n);

%measure run time for sorting algorithms n times
for i = 1:n
    mtrx = rand(100,100);
    tic;smtrx1 = builtinSort(mtrx);builtinTime(i)=toc;
    tic;smtrx2 = bubbleSort(mtrx);bubblesortTime(i)=toc;
end

% Write results to csv
BuiltInSortTime = builtinTime;
BubbleSortTime = bubblesortTime; 
speedupval = bubblesortTime./builtinTime;
Speedup = speedupval;
speeduptable = table(RunID, BuiltInSortTime, BubbleSortTime, Speedup);
writetable(speeduptable,"builtin_vs_bubblesort.csv",'Delimiter'," ");
