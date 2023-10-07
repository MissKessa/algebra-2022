% https://www.lotoideas.com/euromillones-resultados-historicos-de-todos-los-sorteos/
% Create an algorithm that generates new intelligent best on the
% Euromillones draw
% 1.Read the data using xlsxread, and recover the different fields in
% different arrays: fecha(date), comb.ganadora(winners), estrellas(stars)

T=xlsread('Euromillon.xlsx');
[~,data]=xlsread('Euromillon.xlsx');
data=data(2:end,1);
winners=T(:,1:5);
stars=T(:,7:8);
%% 2. For each column of winner finding the different outcomes and their 
% relative frequency, that is the percentage of times that they appear on
% the draw.

%First count the numbers (they are from 1 to 50)
col1=winners(:,1);
number_col1=[]; % an array to store in the position the number of outcomes with that vallue

col2=winners(:,2);
number_col2=[];

col3=winners(:,3);
number_col3=[];

col4=winners(:,4);
number_col4=[];

col5=winners(:,5);
number_col5=[];

for j=1:50
    number_col1=[number_col1,numel(col1(col1==j))];
    number_col2=[number_col2,numel(col2(col2==j))];
    number_col3=[number_col3,numel(col3(col3==j))]; 
    number_col4=[number_col4,numel(col4(col4==j))];
    number_col5=[number_col5,numel(col5(col5==j))]; 
end

% Now, I found the relative frequence
freq_col1=number_col1/length(col1);
freq_col2=number_col2/length(col2);
freq_col3=number_col3/length(col3);
freq_col4=number_col4/length(col4);
freq_col5=number_col5/length(col5);
%% 3. Do the same with the column's stars individually and with its sum
% First count the stars (they are from 1 to 12), and the sum
col_s1=stars(:,1);
number_col_s1=[];

col_s2=stars(:,2);
number_col_s2=[];
for j=1:12
    number_col_s1=[number_col_s1,numel(col_s1(col_s1==j))];
    number_col_s2=[number_col_s2,numel(col_s2(col_s2==j))]; 
end

sum_stars=col_s1+col_s2;
number_sum_stars=[];
for j=min(sum_stars):max(sum_stars) % min(sum_stars)=3, max(sum_stars)=23
     number_sum_stars=[number_sum_stars,numel(sum_stars(sum_stars==j))]; 
end

% Now the frequency:
freq_col_s1=number_col_s1/length(col_s1);
freq_col_s2=number_col_s2/length(col_s2);
freq_sum_stars=number_sum_stars/length(sum_stars);
%% 4. Also finding the relative frequency of the sum of the 5 winners (comb.Ganadora)
sum_winners=col1+col2+col3+col4+col5;
sum_winners2=[];
for i=[1:length(sum_winners)]
    if ~(isnan(sum_winners(i)))
        sum_winners2=[sum_winners2;sum_winners(i)];
    end
end
sum_winners=sum_winners2;
clear sum_winners2
number_sum_winners=[];
for j=min(sum_winners):max(sum_winners) % min(sum_winners)=44, max(sum_winners)=212
     number_sum_winners=[number_sum_winners,numel(sum_winners(sum_winners==j))]; 
end
freq_sum_winners=number_sum_winners/length(sum_winners);
%% 5. Considering the results 2, 3 and 4, draw a new random winner combination.
% Explain how you design the drawing algorithm. You are free on the design.

% I put as 0 in each col the numbers that appear less times than the average
average1=sum(number_col1,'all')/length(number_col1);
number_col1(number_col1<average1)=0;

average2=sum(number_col2,'all')/length(number_col2);
number_col2(number_col2<average2)=0;

average3=sum(number_col3,'all')/length(number_col3);
number_col3(number_col3<average3)=0;

average4=sum(number_col4,'all')/length(number_col4);
number_col4(number_col4<average4)=0;

average5=sum(number_col5,'all')/length(number_col5);
number_col5(number_col5<average5)=0;

% I will call correspondance the matrix with the corresponding numbers on
% the first column and their number of times they appear in the pther one
% that is different from 0
numbers=[1:50];

correspondance1=[];
correspondance2=[];
correspondance3=[];
correspondance4=[];
correspondance5=[];
for j=numbers
    if number_col1(j)~=0
        correspondance1=[correspondance1;j,number_col1(j)];
    end
    if number_col2(j)~=0
        correspondance2=[correspondance2;j,number_col2(j)];
    end
    if number_col3(j)~=0
        correspondance3=[correspondance3;j,number_col3(j)];
    end
    if number_col4(j)~=0
        correspondance4=[correspondance4;j,number_col4(j)];
    end
    if number_col5(j)~=0
        correspondance5=[correspondance5;j,number_col5(j)];
    end
end

%eliminate Nan elements
%for i=[1:length(sum_winners)]
    %if isnan(sum_winners(i,1))
        %sum_winners(i,:)=[];
    %end
%end
%create for each column an array with each number repeated as the
%number_col
col1_repeated=[];
for i=[1:length(correspondance1)]
    for j=[1:correspondance1(i,2)]
        col1_repeated=[col1_repeated; correspondance1(i,1)];
    end
end

col2_repeated=[];
for i=[1:length(correspondance2)]
    for j=[1:correspondance2(i,2)]
        col2_repeated=[col2_repeated; correspondance2(i,1)];
    end
end

col3_repeated=[];
for i=[1:length(correspondance3)]
    for j=[1:correspondance3(i,2)]
        col3_repeated=[col3_repeated; correspondance3(i,1)];
    end
end

col4_repeated=[];
for i=[1:length(correspondance4)]
    for j=[1:correspondance4(i,2)]
        col4_repeated=[col4_repeated; correspondance4(i,1)];
    end
end

col5_repeated=[];
for i=[1:length(correspondance5)]
    for j=[1:correspondance5(i,2)]
        col5_repeated=[col5_repeated; correspondance5(i,1)];
    end
end
% Then, winner:
while true
    random=(length(col1_repeated)-1).*rand(1,1) + 1;
    n1= col1_repeated(round(random,0));
    
    while true
        random=(length(col2_repeated)-1).*rand(1,1) + 1;
        n2= col2_repeated(round(random,0));
        if n2~=n1
            break
        end
    end
    
    while true
        random=(length(col3_repeated)-1).*rand(1,1) + 1;
        n3=col3_repeated(round(random,0));
        if n3~=n1 && n3~=n2
            break
        end
    end
    
    while true
        random=(length(col4_repeated)-1).*rand(1,1) + 1;
        n4=col4_repeated(round(random,0));
        if n4~=n1 && n4~=n2 && n4~=n3
            break
        end
    end
    
    while true
        random=(length(col5_repeated)-1).*rand(1,1) + 1;
        n5=col5_repeated(round(random,0));
        if n5~=n1 && n5~=n2 && n5~=n3 && n5~=n4
            break
        end
    end
    if n1+n2+n3+n4+n5>=sum(sum_winners,'all')/length(sum_winners)
        break
    end
end
disp(""+n1+" "+n2+" "+n3+" "+n4+" "+n5)
%% 6.Do the same with the stars
% I eliminate in each col the numbers that are lower than the average
average_s1=sum(number_col_s1,'all')/length(number_col_s1);
number_col_s1(number_col_s1<average_s1)=0;

average_s2=sum(number_col_s2,'all')/length(number_col_s2);
number_col_s2(number_col_s2<average_s2)=0;

% I will call correspondance the matrix with the corresponding numbers on
% the first column and their number of times they appear in each column
% that is different from 0
numbers=[1:12];
correspondance_s1=[];
correspondance_s2=[];

for j=numbers
    if number_col_s1(j)~=0
        correspondance_s1=[correspondance_s1;j,number_col_s1(j)];
    end
    if number_col_s2(j)~=0
        correspondance_s2=[correspondance_s2;j,number_col_s2(j)];
    end
end

%create for each column an array with each number repeated as the
%number_col
col_s1_repeated=[];
for i=[1:length(correspondance_s1)]
    for j=[1:correspondance_s1(i,2)]
        col_s1_repeated=[col_s1_repeated; correspondance_s1(i,1)];
    end
end

col_s2_repeated=[];
for i=[1:length(correspondance_s2)]
    for j=[1:correspondance_s2(i,2)]
        col_s2_repeated=[col_s2_repeated; correspondance_s2(i,1)];
    end
end


% Then, winner:
while true
    random=(length(col_s1_repeated)-1).*rand(1,1) + 1;
    s1= col_s1_repeated(round(random,0));
    
    while true
        random=(length(col_s2_repeated)-1).*rand(1,1) + 1;
        s2= col_s2_repeated(round(random,0));
        if s2~=s1
            break
        end
    end
    if s1+s2>=sum(sum_stars,'all')/length(sum_stars)
        break
    end
end
disp(""+s1+" "+s2)
%% 7.Plot on the secreen 10 different winning combinations
%I create 2 functions to do the results 5 and 6
for i=[1:10]
    [n1,n2,n3,n4,n5]=calculate_winners_combination(col1_repeated,col2_repeated,col3_repeated,col4_repeated,col5_repeated,sum_winners);
    [s1,s2]=calculate_stars_combination(col_s1_repeated,col_s2_repeated,sum_stars);
    disp(""+n1+" "+n2+" "+n3+" "+n4+" "+n5+" "+s1+" "+s2)
end
