X = randi([1 10], 100);
num_1s = 0;

for i = 1:numel(X)
    if X(i) == 1
        num_1s = num_1s + 1;
    end
end