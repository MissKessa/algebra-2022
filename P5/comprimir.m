clear all
I=imread('moon.jpg');
imshow(I);
A=I(:,:,1);
A=double(A);
[U,S,V]=svd(A);
sp=diag(S);
nval=length(sp);
Irec=zeros(size(A));
Etol=5;
for k=1:nval
    uk=U(:,k);
    vk=V(:,k);
    Irec=Irec+sp(k)*uk*vk';
    Id=round(Irec);
    imshow(uint8(Id));
    title(num2str(k))
    pause(1)
    d1=norm(A(:)-Id(:),1)/norm(A(:),1)*100;
    if d1 < Etol
        break;
    end
end