%% Diagonalization eig command
A=rand(3);
[P,D]=eig(A);
rank(P)
rank(D)
eigenvaluesA=diag(D); %autovalores
%autovectores
v1=P(:,1);
v2=P(:,2);
v3=P(:,3);
A*v1(:)-wigwnvaluesA(1)*v1(:));
A*v2(:)-wigwnvaluesA(2)*v2(:));
A*v3(:)-wigwnvaluesA(3)*v3(:));

P*D*inv(P);%=A
[v,spectrum]=findeigen(A);
%% symmetric matrices
A=randn(3);
B=A*A';
C=A'*A;
[v,spectrum]=findeigen(B);
[v,spectrum]=findeigen(C);
rank(A);
rank(A*A');
rank(A'*A);
P[v{1} v{2} v{3}];
P'*P; %identity
P*P'; %identity
[P,D]=eig(A*A');
