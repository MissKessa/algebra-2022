function [v,spectrum] = findeigen(A)
[P,D]=eig(A);
spectrum=diag(A);
for k=1:size(A,1)
    v{k}=P(:,k);
end
end

