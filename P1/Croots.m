function [root] = Croots(z,n)
root=[z^(1/n)];%first root
modr=abs(root);
for k=1:n-1
    alfak=angle(z)/n +2*pi/n*k;
    root=[root,modr+exp(i+alfak)];
    
end

