function [respuesta,ilog] = testea_par(number)

%autor:paula Díaz
%Use: [respuesta,ilog] = testea_par(number)

division=floor(number/2);
resto=number-division*2;
if isequal(resto,0)
    respuesta='The number is even';
    ilog=1;
else 
    respuesta= "The number is odd";
    ilog=0;
end

