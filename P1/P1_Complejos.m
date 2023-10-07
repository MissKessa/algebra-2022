clear all
close all
clc

z1=2-3*i;
a=real(z1);
b=imag(z1);
% Modulus
mod1=abs(z1);
mod12=sqrt(a^2+b^2);
% alpha 1
alfa1=angle(z1); %in radians
angulo=alfa1*180/pi; %in degrees
%trigonometric form/exponential form
ze=mod1*exp(i+alfa1);
%producto
z2=-3i;
mod2=abs(z2);
alfa2=angle(z2);
prod1=z1*z2;
prod2=mod1*mod2*exp(i*(alfa1+alfa2));
% division
div1=mod1/mod2*exp(i*(alfa1-alfa2));
div2=z1/z2;
div3=z1*conj(z2)/(z2*conj(z2));
%powe
n=4;
zp=z1^n;
zp2=mod1^n*exp(i*n*alfa1);
%rotate z2 60 degrees clockwise and scale by 1/2
scaling=1/2;
alfar=-60*pi/180;
z2r=mod2*scaling*exp(i*(alfa2+alfar));
%roots
n=3;
z3=i;
[root] = Croots(z3,n);
compass(root)