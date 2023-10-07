function [proyection] = Second_project_regression_sells(degree,sells,months)
%Calculates the discrete regression of the accumulative sells on a period
%of time (months) onto a polynomial with a given degree
x=sym('x','real');
le=length(months); %length(months);

x=[1:1:le];
U=[ones(le,1),x(:)];
for index=2:degree 
    xn=x.^index;
    U=[U,xn(:)];
end
A=U'*U; %Gram matrix
b=U'*sells(:); %comparisong (U'*y_observe)
coord=inv(A)*b(:); %coordinates of the proyection

proyection=U*coord(:);
end