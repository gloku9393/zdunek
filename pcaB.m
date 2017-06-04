function [V pc D] = pcaB(data, J)
    data = data';
    hold on;
    plot(data(:,1), data(:,2), 'o');
    [n, m] = size(data);
    dMean = mean(data);
    dStd = std(data);
    B = (data - repmat(dMean,[n 1])) ./ repmat(dStd,[n 1]);
    C = cov(B);
    [V D] = eigs(C,J);
    [D order] = sort(diag(D), 'ordered');
    V = V(:, order);
    x1=linspace(0,V(1,1));
    y1=linspace(0,V(1,2));
    x2=linspace(0,V(2,1));
    y2=linspace(0,V(2,2));
    plot(x1,y1);
    plot(x2,y2);
    pc=data*V; %uwaga moze zle 
    plot(p(:,1), p(:,2), 'ro');
end
