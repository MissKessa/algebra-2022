v1=[1,0,1,2];
v2=[2,1,1,1];
v3=[1,1,0,-1];
length(v1);
%independece
R=[v1; v2; v3]; %row wise
C=[v1(:) v2(:) v3(:)]; %column wise
% rref:Gauss Jordan reduced form of a marix
r1=rref(R); %R and rref(R) are equivalent
%The number of non-null vectors in r1 is the rank of R
rank(R);
rank(r1)
%the same can be done with C
c1=rref(C);
rank(C);
rank(c1)
%the rank of a matrix is the same row wise and column wise
rank(R)-rank(C);

v4=2*v1-3*v2;
R1=[v1; v2; v3;v4];
rref(R1);

R'; %Transpose
cor=R(1:end-1,end); %coordinates