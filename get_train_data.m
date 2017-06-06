function [images, transformImages] = get_train_data(classes, idx, J)
    [images, img_rows, img_cols] = readData(classes, idx);
    [eFaces, meanFace] = pcaFace(images, J);
    transformImages = transImages(images, eFaces, meanFace);
    total = 0;
    for i = 1:100
        tic;
        [a, b] = kmeans(transformImages, classes);
        total = total + toc;
    end
    % ----- przyklady rekonstrukcji z eigenfaces dla jenej twarzy
    % Q = images(1,:); %pierwsze zdjecie
    % 
    % figure(5);
    % imshow(row2mat(Q, img_rows, img_cols));
    % figure(6);
    % steps = 10:20:min(J, 320);
    % for i=1:min(16, length(steps))
    %     subplot(4,4,i);
    %     num_evs = steps(i);
    %     o_e_faces = eFaces(:,1:num_evs);
    %     P = (Q - meanFace) * o_e_faces;
    %     R = P * o_e_faces' + meanFace;
    %     imshow(row2mat(normalize(R), img_rows, img_cols));
    %     title(sprintf('%i', num_evs))
    % end