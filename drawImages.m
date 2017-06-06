function [a] = drawImages(data, n, k, fig, title)
figure(fig);
for i = 1:rows(data)
    subplot(n, k, i);
    imshow(reshape(uint8(normalize(e_faces(:,i))), rows, columns));
    title(sprintf(title, i));
end