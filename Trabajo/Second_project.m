% A company invest 8000 dollars in marketing to acquire new clients. The
% company also has the following information:
% 1.The cost of gettung a new client is 40 dollars
% 2.The average fee is 30 dollars/month
% 3.The percentage of clients that stay after the first month (churn):
%   churn(%)=[100, 85, 60, 50, 30, 25, 20, 9, 5, 1, 0]
%   months=[1,2,3,4,5,6,7,8,9,10,11]=[1:11]
% Write a program to find the cumulative sells curve for every month till
% all the clients churns: sells(1), sells(1)+sells(2),
% sells(1)+sells(2)+sells(3)
months=[1:11];
churn=[100, 85, 60, 50, 30, 25, 20, 9, 5, 1, 0];
client_month=8000/40; %Total clients (clients at the first month)
sum_sells=0;
sells=[];
for index=1:length(months)
    sells_month=client_month*churn(index)/100*30; %sells in the month

    sum_sells=sum_sells+sells_month; %acumulative sells
    sells(index)=sum_sells; %put in each month the acumulative sells
end
%% Write a program to fit this curve using a polynomial. Define the degree
%I do a discrete regression
x=sym('x','real');
le=length(months); %length(months);
degree=4;

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
plot(sells,'r');
hold on
plot(proyection,'g-.');
%% Function
degree=input("Write the degree: ");
proyection=Second_project_regression_sells(degree,sells,months);
plot(sells,'r');
hold on
plot(proyection,'g-.');