a=rand(1,10); %Uniform (0,1)
w=randn(1,10); %Normal (0,1)
%U(a,b) x=a+(b-a)*rand(1,n)
%U(3,10) n=5
z=3+7*rand(1,5);
%N(2,0.25)
y=2+0.25*randn(1,1000000);
histogram(y);
%addig one component
x=rand(1,3);
x=[x(:);rand(1)]; %thil will work forever because we are forcing x to be a column vector
x=[x(:)';rand(1)]; %LO tanspongo la x si no es columna
x=[x,rand(1)]; %this not

x=[1:0.2:10]; %vector del 1 al 10 con un paso de 0.2
lengh(x);
x=linspace(1,10,25); %genera un vector del 1 al 10 con 25 componenes
step=(10-1)/24; %step=(b-a)/(n-1)
x1=[1:step:10];