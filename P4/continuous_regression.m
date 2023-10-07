x=sym('x','real'); %x is a simbolic variable and it is real
a=0;
b=1;
U=[1,x,x^2];
f=exp(x);
f0=subs(f,x,0);

B=U'*U;
G=int(B,a,b); %Gram matrix is the integral of that matrix(of each term)
c=U'*f;
d=int(c,a,b);
par=inv(G)*d(:);
pretty(par);
p2=U*par(:); %the polynomial
fplot(f,[a b],'r');
hold on
fplot(p2,[a b],'m')
%the integral of f and the integral of p2 has to be the same
i1=int(f,a,b);
i2=int(p2,a,b);
%error: the norm of f and p2
err=(f-p2)^2;
Eabs=sqrt(int(err,a,b));
Erel=Eabs/sqrt(int(f^2,a,b))*100; %relative error: absolute error/norm of f
double(Erel);
%% if a i want a polynomisl of degree 3
x=sym('x','real'); %x is a simbolic variable and it is real
a=0;
b=1;
U=[1,x,x^2,x^3];
f=exp(x);
f0=subs(f,x,0);

B=U'*U;
G=int(B,a,b); %Gram matrix is the integral of that matrix(of each term)
c=U'*f;
d=int(c,a,b);
par=inv(G)*d(:);
pretty(par);
p2=U*par(:); %the polynomial
fplot(f,[a b],'r');
hold on
fplot(p2,[a b],'m')
%the integral of f and the integral of p2 has to be the same
i1=int(f,a,b);
i2=int(p2,a,b);
%error: the norm of f and p2
err=(f-p2)^2;
Eabs=sqrt(int(err,a,b));
Erel=Eabs/sqrt(int(f^2,a,b))*100; %relative error: absolute error/norm of f
double(Erel);