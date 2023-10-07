r=25;
% computes the area of a circle of radius r
% a = the area of the circle of radius r=pi*r^2
disp('Buenas\n:')
[a,msg,imsg]=circle_area_3(r);
if imsg
    fprinf('%s \n',msg);
    fprintf("The area of a circle of radius %6.2f is %6.2f\n",r,a);
    fprintf('Adios');
else
    fprinf('%s \n',msg);
    fprin('Study MF')
end