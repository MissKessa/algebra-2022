D = 'C:\Users\Ana\Desktop\Asignaturas\Algebra_Inglés OVIEDO\PLs\3. EuclideanSpaces\caras\imagenes';% Directory
img=dir(fullfile(D,'*.pgm'));% crea el array img y asigna al campo "name" los nombres
N=length(img);% nr. of elements of the array img
for k=1:N
    fprintf('Imagen: %d\n',k);% it prints on the Command Window the number of the image He is reading
    Ik_name=img(k).name;%It gets the name of the image k. You must be situated in the image Folder or...
%     filename_k=fullfile(D,img(k).name);% use this if you are not located in the Folder (it gets the whole pathway)
    Ik=imread(Ik_name);
    imshow(Ik), title(Ik_name)% it shows the image and the real name of the image file is shown above
    pause(0.3)% it pauses 
    img(k).imagen=Ik;% save Ik in the array img
end
save faces img
%% Show all the images in the same window
figure % the new window where it will show all images
for k=1:N-1% we want only the first N-1 images (24 images)
    subplot(4,6,k) % sets the window with 4 lines and 6 columns where it will plot our images
    imshow(img(k).imagen)
end

