function [acc] = get_accuracy(results, classes, idx)
    total = 0;
    for i=1:classes
        if sum(results(((i-1)*idx)+1:i*idx) == mode(results(i:i*idx))) <= idx
            total = total + sum(results(((i-1)*idx)+1:i*idx) == mode(results(i:i*idx))) / idx;
        else
            total = total + 1;
        end
    end
    acc = double(total / classes);