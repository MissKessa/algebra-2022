N=10000;
altura=17+15*randn(1,N);
histogram(altura);
histogram(altura,50);

altos= (altura>=200);
Number_altos =sum(altos);
Probabilidad_alto = Naltos/N*100;

%Generamos 1000 poblaciones
Nsimul=1000;
N=10000;
mu=175;
dst=15;
hgasol=200;
for k=1:Nsimul
    altura=mu+ds*randn(1,N);
    altos=(alura>=hgasol);
    Naltos=sum(altos);
    Pgasol(k)=Naltos/k;
end
median(Pgasol);
mean(Pgasol); %*100=percentage
sd(Pgasol);