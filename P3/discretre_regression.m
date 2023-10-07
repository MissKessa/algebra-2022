%% 
clc
close all
clear all

[ndata,ext,alldata]=xlsread('AmazonStocks.xlsx');
price=ndata;
plot(price,'k-o');
nval=length(price); %points of the graph [1,y1][2,y2].....[13,y13], I am working in R13
%fitting staight line y*(xi)~yi
%y*(xi)=a0+a1*xi
%y_prediction= [y*(x1)...y*(x13)](:)=[a0+a1*x1....a0+a1*x13](:)=a0*[1.....1](:)+ai*[x1,....x13](:)=a0*1_vector+a1*x_vector
%y_prediction lays is an hyperplane of space 13 wih dimension 2.
%y_predicion belongs to the span of <1_vector,x_vector>=U. U is a subspace of dimension 2 in R13
%y_observe=[y1....y13](:) are the prices observe
%||y_observe-y_prediction||=minimum
%y_predicion= the orthogonal proyection of y_observe onto U
%if i fit a parabola y_prediction=a0*1_vector+a1*x_vector+a2*(x^2_vector). dim U=3

%y_prediction=[1,xi](:)*[a0,a1](:)=U[a0,a1](:)~y_observe
x=[1:1:nval];
U=[ones(nval,1),x(:)];
%U[a0,a1](:)=y_observe    Overdetermined linear system: #equations m=13>>#number unknown=2
%<->least squares sense U'*U[a0,a1](:)=U'*y_observe

%least-squares system
A=U'*U; %U'*U[a0,a1](:)
b=U'*price(:); %U'*y_observe
a=inv(A)*b(:); %inv(A) inverse     %parameters of he regression

prediction=U*a(:); %U[a0,a1](:)=y_observe
hold on
plot(prediction,'m-.');

%Cuanto valdrá amazon en 2023(predicción)??
price23=dot([1,nval+1],a); %U=[ones(nval+1,1),x(:)]  %x=[1:1:nval+1] nval=13+1=14

%Quadratic regression
x2=x.^2; %(x^2_vector)
U=[ones(nval,1),x(:),x2(:)];

A=U'*U;
b=U'*price(:);
a=inv(A)*b(:);

prediction=U*a(:);
hold on
plot(prediction,'g-.');

price23=dot([1,nval+1,(nval+1)^2],a);

%misfit
Eabs=norm(prediction(:)-price(:)); %absolute Error
Erel=Eabs/norm(price)*100; %relative Error (%) 
RMS=Eabs/sqrt(nval);%Root min square Error= Error absoluto/raiz cuadrada de la dimension del espacio. Tiene las unidades de mis datos ($)
%RMS^2=||y_observe-y_prediction||^2/m

%3º regression
x3=x.^3; %(x^2_vector)
U=[ones(nval,1),x(:),x2(:),x3(:)];

A=U'*U;
b=U'*price(:);
a=inv(A)*b(:);

prediction=U*a(:);
hold on
plot(prediction,'y-.');

price23=dot([1,nval+1,(nval+1)^2,(nval+1)^3],a);

Eabs=norm(prediction(:)-price(:)); %absolute Error
Erel=Eabs/norm(price)*100; %relative Error (%) %The eror hasn't changed and the complecity increased