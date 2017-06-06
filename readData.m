function [images, img_rows, img_cols] = readData(classes, idx)
    images = [];
    % ---- wczytywanie zdjec
    for p =1:classes
        for i = 1:idx
            image = imread(['C:\Users\Mateusz\zdunek\s' num2str(p) '\' num2str(i) '.pgm']);
            [img_rows, img_cols] = size(image);
            images = [images; double(reshape(image, 1, img_rows * img_cols))];
        end
    end
    