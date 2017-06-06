function X = normalize (X)
    minX = min(X(:));
    maxX = max(X(:));
    X = X - minX;
    X = X ./ (maxX - minX);
    X = X .* (255);
    X = X ;
end
