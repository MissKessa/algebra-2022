function [n1,n2,n3,n4,n5] = calculate_winners_combination(col1_repeated,col2_repeated,col3_repeated,col4_repeated,col5_repeated,sum_winners)
% Calculates a winning combination

% -col1_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col1

% -col2_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col2

% -col3_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col3

% -col4_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col4

% -col5_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col5

% -sum_winners: It’s the sum of the 5 columns of the numbers

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
end
