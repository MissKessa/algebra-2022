n=input("The number of bits: ");
Ngcodes=0;
for k=1:n
    Ngcodes=Ngcodes+2^(k-1); %number of gray codes
end
fprintf("The number of gray color codes with %i bits is: %i \n'",n,Ngcodes+1)

%Images
%Example 3
I=imread("Moon.png");
size(I); %If he has 3 channels is a color image
imshow(I);
R=I(:,:,1); %Red
G=I(:,:,2); %Green
B=I(:,:,3); %Blue
imshow(R);
imshow([R G B]);
imshow([R;G;B]);
o1=[R;G;B];
imshow([o1 o1]);
imshow(R);
ginput(4);
center=I(90:490, 400:800);
imshow(center)
size(center)
S=(center+center')/2; %Parte simétrica
imshow(S);
A=(center-center')/2; %Parte antisimétrica
imshow(A);