%%
%Euclidean Spaces
%R^n
%v1=rand(1,3);v2=rand(1,3);
v1=[1,0,1];
v2=[2,-1,-1];
%Euclidean scalar product
c1=dot(v1,v2);
c2=sum(v1.*v2);
%norm
n1=norm(v1); %the same as n1=norm(v1,2);
n1_1=sqrt(dot(v1,v1));
n2=norm(v2); %the same as n2=norm(v2,2);
n2_1=sqrt(dot(v2,v2));
%angle
alfa=acos(c1/(n1*n2))*180/pi; %in degrees
alfa_1=acos(c1/(n1*n2)); %in radians
d12=norm(v1-v2); %the distance between v1 and v2
%changin he Gram's matrix
G=[2,0,0;0,1,0;0,0,2]; %diagonal, squared and positive (diagonal is positive)
sp=v1*G*v2(:); %scalar product. it changed because i changed he matrix
ng1=sqrt(v1*G*v1(:));%norm of v1
ng2=sqrt(v2*G*v2(:));
alfaG=acos(sp/(ng1*ng2))*180/pi;
%% 
%other norms
norma1=sum(abs(v1)); %norma 1 de v1
norma1_1=norm(v1,1);
%
p=4;
np=(sum(abs(v1)).^p)^(1/p); %p norm
np_1=norm(v1,p);
%p=inf
ninf=max(abs(v1)); %inf norm
ninf_1=norm(v1,inf);
%p=0
norm0=sum(v1==0);

