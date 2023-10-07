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

%face recognition
nx=2;
ic=1;
for k=1:ncaras
    carak=img(k).imagen;
    if abs(k-nx)>0
        subplot(5,5,k); 
        imshow(carak);
        ic=ic+1;
    end
    U=[U,double(carak(:))];
end
%carax_vector belong to M m x n(R)
%U=<cara1_vector......caram_vector>
%finding p_vector belonging to U such as ||cara_x_vector-p_vector||=min
carax=img(nx).imagen; %cogemos la 2 por ejemplo
figure
imshow(carax)
carax=double(carax);
U(:,nx)=[]; %eliminamos esa imagen de mi espacio de caras

A=U'*U;
b=U'*carax(:);
par=inv(A)*b(:);
figure
stem(par);
%coordenadas positivas se parecen, negaivas no

%now with the first
nx=1;
carax=double(img(nx).imagen); %cogemos la 2 por ejemplo
U(:,nx)=[]; %eliminamos esa imagen de mi espacio de caras

%carax_vector belong to M m x n(R)
%U=<cara1_vector......caram_vector>
%finding p_vector belonging to U such as ||cara_x_vector-p_vector||=min

A=U'*U;
b=U'*carax(:);
par=inv(A)*b(:);
figure
stem(par);
%coordenadas positivas se parecen, negaivas no

%% 

%other way: Finding the cosinus
for i=1:size(U,2)
    facei=U(:,i);
    anglef(i)=acos(dot(facei(:),carax(:))/(norm(facei(:))*norm(carax(:))))*180/pi; %angle between facei and carax in degrees
end
[ix,jx]=min(anglef);