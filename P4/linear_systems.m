%first case:Squared systems
A=rand(3);
b=rand(3,1);
x=inv(A)*b(:); %if the solution exists and it's unique
round(A*x-b);
%Rouché Frobenius theorem
Ab=[A b(:)]; %Augmented matrix
deltar=rank(Ab)-rank(A);
%SCD(Compatible determinate linear system)
if deltar==0
    fprintf("The isolution exists and it is unique\n")
    x=inv(A)*b(:);
    %Gaus Jordan
    R=rref(Ab);
    xsol=R(:,end);
else
    fprintf("The inverse doesn't exist\n")
end
%% 
%% | _ *case 2: compatible underdetermined linear system* _ |
A=rand(2,3);
b=rand(2,1);
Ab=[A b(:)];
deltar=rank(Ab)-rank(A);
R=rref(Ab);
%Particular solution
xp=[R(1,end),R(2,end),0];
null=null(A);
%random solution
xr=xp(:)+rand(1)*null(:);
round(A*xr(:)-b(:))
%the simplest solution (minimun norm solution)
xnm=A'*inv(A*A')*b(:);
round(A*xnm(:)-b(:))
%% case 3: Uncompatible overdetermined lineat system
A=rand(3,2);
b=rand(3,1);
Ab=[A b(:)];
deltar=rank(Ab)-rank(A);
R=rref(Ab);
if deltar>0
    fprintf("The solution does not exist \n")
    fprintf("The least square solution is: \n")
    xls=inv(A'*A)*A'*b(:);
    Erel=norm(A*xls(:)-b(:))/norm(b)*100;
end
%% case 4: rank deficient rank(A)<min(m,n), there no exiss solution
%least squares solution has infinite solutions, so i fin the minimum norm
%solution of the leas squares
A=[1 2 0;0 1 1;1 3 1];
rank(A)
b=rand(3,1);
rank([A,b(:)])
inv(A'*A)
[A'*A A'*b]
R=rref([A'*A A'*b]);
C=R(1:2,1:3);
c=R(1:2,end);
xlsmn=C'*inv(C*C')*c(:); %least squares solution minimum norm
%esta funcion es lo mismo que lo anterior
pinv(A)*b(:) %resuelve todos los casos


