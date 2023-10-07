close all
clear
clc
load('faces.mat');
img(1); %cara 1
ncaras=length(img);% number of caras
U=[]; %genero una matriz vacio
for k=1:ncaras
    carak=img(k).imagen; %nombre fichero y leemos la imagen
    subplot(5,5,k); %orla de 5x5 al se 25 caras
    imshow(carak);
    U=[U,double(carak(:))]; %añadimos las caras en vectores columnas y las transformamos en double
end

%Gram Smichdt algorithm to othogonalize the faces
fk=U(:,1); %column k of U
o{1}=fk/norm(fk);
for k=1:ncaras
    subplot(5,5,k);
    fk=U(:,k); %column k of U
    o{k}=fk;
    for j=1:k-1
       o{k}=fk-dot(fk,o{j})*o{j}; 
    end
    o{k}=o{k}/norm(o{k});
    ofacek=reshape(o{k},size(carak));
    imagesc(o{k});
    axis off
end

%% 
close all
clear
clc
load('faces.mat');
img(1); %cara 1
ncaras=length(img);% number of caras
U=[]; %genero una matriz vacio
nx=7;
ic=25;

for k=1:ncaras
    carak=img(k).imagen; %nombre fichero y leemos la imagen
    subplot(5,5,k); %orla de 5x5 al se 25 caras
    imshow(carak);
    U=[U,double(carak(:))]; %añadimos las caras en vectores columnas y las transformamos en double
end

%Gram Smichdt algorithm to othogonalize the faces
fk=U(:,1); %column k of U
o{1}=fk/norm(fk);
O=[];
for k=1:ncaras-1
    subplot(5,5,k);
    fk=U(:,k); %column k of U
    o{k}=fk;
    for j=1:k-1
       o{k}=fk-dot(fk,o{j})*o{j}; 
    end
    o{k}=o{k}/norm(o{k});
    ofacek=reshape(o{k},size(carak));
    imagesc(o{k}),
    axis off
    O=[O o{k}];
end
carax=img(nx).imagen;
carax=double(carax(:));
proj=O'*carax(:);
rcarax=O*proj;
figure
subplot(1,2,1)
imagesc(reshape(carax,size(carak)));
subplot(1,2,2)
imagesc(reshape(rcarax,size(carak)));
