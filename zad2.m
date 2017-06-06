clear all;
Y = [];
c = [];
persons = 30;
nr_photos = 10;
J = persons*nr_photos;
images = [];
average = double(imread(['C:\Users\Mateusz\zdunek\s1\1.pgm']))*0;
% ---- wczytywanie zdjec
for p =1:persons
    for i = 1:nr_photos
        image = imread(['C:\Users\Mateusz\zdunek\s' num2str(p) '\' num2str(i) '.pgm']);
        % ---- wyswietl zdjecia orginalne zdjecia
%         subplot(persons,nr_photos,nr_photos*(p-1)+i);
%         imshow(image);
%         title(sprintf('Zdjecie %i', (p-1)*i + i));
        % ---- zapisanie zdjecia do wspolnej macierzy
        [rows, columns] = size(image);
        images = [images; double(reshape(image, 1, rows*columns))];
    end
end

% ---- obliczanie twarzy sredniej
mean = mean(images);
% figure(2);
% imshow(reshape(uint8(mean), rows, columns));
% title('Twarz srednia');

% ---- noramlizacja zdjec przez odjecie sredniego obrazu
normalize_images = images - repmat(mean, nr_photos*persons, 1);

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
e_faces = normalize_images' * e_vectors;
% ---- nromalizacja
for i=i:persons*nr_photos
    e_faces(:,i) = e_faces(:,i)/norm(e_faces(:,i));
end
    
% ---- wybierz J wartosci
[e_values, order] = sort(diag(e_values),'descend');
e_faces = e_faces(:, order);
e_faces = e_faces(:,1:J);
% ---- narysuj twarze wlasne
% figure(5);
% for i = 1:J
%     subplot(persons, nr_photos, i);
%     imshow(reshape(uint8(normalize(e_faces(:,i))), rows, columns));
%     title(['Twarz wlasna ' i])
% end

% ----- przyklady rekonstrukcji z eigenfaces dla jenej twarzy
steps = 10:20:min(nr_photos*persons,320);
Q = images(1,:); %pierwsze zdjecie
figure(5);
imshow(reshape(uint8(Q), rows, columns));
figure(6);
for i=1:min(16, length(steps))
    subplot(4,4,i);
    num_evs = steps(i);
    o_e_faces = e_faces(:,1:num_evs);
    P = (Q - mean) * o_e_faces;
    R = P * o_e_faces' + mean;
    imshow(reshape(uint8(normalize(R)), rows, columns));
    title(sprintf('%i', num_evs))
end



% % average face
% figure(2);
% average = uint8(average/(nr_photos*3));
% imshow(average);
% [V newX D] = pcaB(Y, 6);
% 
% [Inx, C] = kmeans(newX', 3);
% [Inx, C] = kmeans(Y', 3);
