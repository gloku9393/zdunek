function [tansformImages] = transImages(data, eFaces, meanFace)
    [rows, cols] = size(data);
    
    for i=1:rows
        Q = data(i,:);
        P = (Q - meanFace) * eFaces;
        % R = P * eFaces' + meanFace;
        tansformImages(i,:) = normalize(P);
    end