function [s1,s2] = calculate_stars_combination(col_s1_repeated,col_s2_repeated,sum_stars)
% Calculates a winning combination for the stars

% -col_s1_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col_s1

% -col_s2_repeated: An array with each number (that is repeated more times than or equal to the average) repeated as the number_col_s2

% -sum_stars: It’s the sum of the 2 columns of the stars
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
end
