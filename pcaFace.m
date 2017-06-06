function [eFaces, meanFace] = pcaFace(images, J)
    % ---- obliczanie twarzy sredniej
    meanFace = mean(images);
    [rows, cols] = size(images);
    % figure(2);
    % imshow(reshape(uint8(mean), rows, columns));
    % title('Twarz srednia');

    % ---- noramlizacja zdjec przez odjecie sredniego obrazu
    normalize_images = images - repmat(meanFace, rows, 1);
    % ---- narysuj zdjecia po normalizacji
    % figure(3);
    % for i = 1:persons*nr_photos
    %     subplot(persons, nr_photos, i);
    %     imshow(reshape(uint8(normalize(normalize_images(i,:))), rows, columns));
    %     title(sprintf('Zdjecie %i sredniej', i))
    % end
    % ---- wyliczanie twarz wlasnych (eigen faces)
    covarience = normalize_images * normalize_images';
    [e_vectors, e_values] = eig(covarience);
    eFaces = normalize_images' * e_vectors;
    % ---- nromalizacja
    for i=1:rows
        eFaces(:,i) = eFaces(:,i)/norm(eFaces(:,i));
    end
    % ---- wybierz J wartosci
    [e_values, order] = sort(diag(e_values),'descend');
    eFaces = eFaces(:, order);
    eFaces = eFaces(:,1:J);
