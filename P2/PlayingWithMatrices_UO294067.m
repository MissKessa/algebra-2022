%PlayingWithMatrices_UOxxxxxxx.m   
%1.Generate 3 random U(0,1) matrices , called A, B, C of size 5x3 and transform them into 3 row vectors, called a, b, c.
%2.Create a Matrix called D having a, b, c as column vectors.
%3.Create a matrix E of the size of D such as E(i,j)=1 if  D(i,j)>0.5, otherwise 0.
%4.Using the order rank, finding the rank of the system {a,b,c}
%5.Create the matrix F=2*A-B+C and finding its coordinates in the basis {A,B,C} by using the command rref.
%% Generate 3 random U(0,1) matrices , called A, B, C of size 5x3 and transform them into 3 row vectors, called a, b, c
A=rand(5,3);
B=rand(5,3);
C=rand(5,3);

a=A(:)';
b=B(:)';
c=C(:)';
%% Create a Matrix called D having a, b, c as column vectors
D=[a(:),b(:),c(:)];
%% Create a matrix E of the size of D such as E(i,j)=1 if  D(i,j)>0.5, otherwise 0.
E=rand(size(D));
E(D>0.5)=1;
E(D<=0.5)=0;
%% Using the order rank, finding the rank of the system {a,b,c}
rank(D);
%% Create the matrix F=2*A-B+C and finding its coordinates in the basis {A,B,C} by using the command rref.
F=2*A-B+C;
rref(F);
