function [acc, time] = get_average_result(images, classes, idx, repeats)
    total_time = 0;
    acc_total = 0;
    for i = 1:repeats
        tic;
        [results, b] = kmeans(images, classes);
        total_time = total_time + toc;
        acc_total = acc_total + get_accuracy(results, classes, idx);
    end
    time = total_time / repeats;
    acc = acc_total / repeats;