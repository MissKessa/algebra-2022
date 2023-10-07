%% Perfom the continuous regression of f(x) onto the subspace <1,x,x^2>
x=sym('x','real');
f=log(x);
%[1,e]
a=1;
b=exp(1);
U=[1,x,x^2];

%Calculate the gram matrix
B=U'*U;
G=int(B,a,b); %Gram matrix is the integral of that matrix(of each term)
%Calculate the comparison vector
c=U'*f;
d=int(c,a,b);
par=inv(G)*d(:); %calculate the coordinates of the projection
p2=U*par(:); %the projection(polynomial)
fplot(f,[a b],'r');
hold on
fplot(p2,[a b],'m')
%% Perfom the discrete regression of f(x) onto the subspace <1,x,x^2>.
%1. Introduce a sampler of the interval [1,e] using 1000 points. sampler:xs
%2.Evaluate f on xs, and the basis functions 1,x,x^2 to generate {1,x,x^2,f}
%3.Perfom the regression of f onto <1,x,x^2>.
%4. Plot the result (function and fitting)
%1-----
c=100; %number of samples
x=sym('x','real');
f=log(x);
xs=[];
for index=(linspace(1,exp(1),c))
    xs=[xs,subs(f,x,index)];
end
%2----
%fitting=parabola=a0*(1_vector)+a1*(x_vector)+a2*(x^2_vector)
%the fitting lays is an hyperplane of space 1000 wih dimension 3.
%fitting belongs to the span of <1,x,x^2>=U. U is a subspace of
%dimension 3 in R1000
%||xs-fitting||=minimum. fitting= the orthogonal proyection of xs onto U
%proyection=[1,xi,(x^2)i](:)*[a0,a1,a2](:)=U[a0,a1,a2](:)~x
x=[1:1:c];
x2=x.^2;
U=[ones(c,1),x(:),x2(:)];
%U[a0,a1,a2](:)=proyection    Overdetermined linear system: #equations m=1000>> #unknown=3
%<->least squares sense U'*U[a0,a1,a2](:)=U'*proyection
%3---
A=U'*U; %Gram matrix
b=U'*xs(:); %comparisong (U'*y_observe)
coord=inv(A)*b(:); %coordinates of the proyection

proyection=U*coord(:);
plot(xs,'r');
hold on
plot(proyection,'g-.');