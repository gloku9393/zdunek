function [image] = row2mat(row, n, k)
    image = reshape(uint8(normalize(row)), n, k);
