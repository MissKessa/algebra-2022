A=[1 2 3;4 5 6];
size(A);
%generate a random matrix of 5 rows and 3 columns stacking row random vectors
B=[];
for k=1:5
    x=rand(1,3);
    B=[B;x(:)'];
end
%generate a random matrix of 5 rows and 3 columns stacking column random vectors
C=[];
for k=1:3
    x=rand(5,1);
    C=[C,x(:)];
end
eye(3)%Identity matrix
a=rand(4);
diag(a);%Extracts the diagonal i a column vector
a(2,:); %get the second row
a(1:3,2); %get the second columns
a(3,3)=0; %change the element (3, 3) to 0
a(a>0.5)=0; %change the elements >0.5 to 0
A=3+2*rand(4,2);
round(A); %redondea cada elemeno
floor(A); %redondear para abajo
ceil(A); %redondear para arriba
A(2,:)=[]; %Eliminar la ultima fila
A(:,end)=[]; %Eliminar la ultima columna

A=rand(4,2);
B=rand(4,2);
C=A.*B; %Multiplicaion term by term (aij*bij=cij)

