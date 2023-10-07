I=imread("marylin.jpg");
size(I);
imshow(I);
R=I(:,:,1); %Red
G=I(:,:,2); %Green
B=I(:,:,3); %Blue
imshow([R G B]);
M=[R G B];
imagesc(M);
axis off;