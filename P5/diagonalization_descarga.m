% Diagonalization eig command
A=rand(3); % random matrix
[V,D]=eig(A);
spectrum=diag(D); %eigenvalues
v{1}=V(:,1);  %eigenvectors
v{2}=V(:,2);
v{3}=V(:,3);
dot(v{1},v{2}) %generally, they are not orthogonal 
zeroM=round(A*V-V*D); %
% case of symmetric matrices
A=[1 0 1; 2 -1 1];
rank(A)
% correlation matrices
M1=A*A'; %row C
M2=A'*A; %col C
% Part1: these matrices are symmetric
% the rank of M1 and M2 is the rank(A)
zeroR1=rank(M1)-rank(A);
zeroR2=rank(M2)-rank(A);
null(M1) % the smaller has a trivial kernel
null(M2) % the biggest has a kernel whose dimension is size(M2,1)-rank(M2)
% Therefore M2 has 0 as eigenvalue
% M1 has not 0 as eigenvalue

% Part2 
% M1 and M2 have real spectrums because they are symmetric
% M1 and M2 have the same non-null eigenvalues
[V1,D1]=eig(M1);
[V2,D2]=eig(M2);
sp1=diag(D1);
sp2=diag(D2);

% Part 3
% the eigenvectors corresponding to different eigenvalues are orthogonal
dot(V1(:,1),V1(:,2))
dot(V2(:,1),V2(:,2))
dot(V2(:,2),V2(:,3))

% Part 4
% M1 is definite positive  x'*M1*x >0 for any nonnull x
% M2 is semidefinite positive  x'*M2*x >= 0
C1=sp1>0;
d1=sum(C1)-length(sp1);
C2=sp2>eps
d2=sum(C2)-length(sp2);

% Part 5 
% the svd of A
% U comes from V1
% V comes from V2
% the spectrum of S (singular values of A) is the sqrt of the non-null eigenvalues of (sp1) | (sp2)
[U,S,V]=svd(A);
sp3=diag(S);
sp3.^2
%-----------------------------
B=6*rand(3);
A=round(B*B');
[P,Da]=eig(A);
[Ua,Sa,Va]=svd(A);









