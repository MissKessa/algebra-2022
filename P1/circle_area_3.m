function [a,msg,imsg] = circle_area_3(r)
% computes the area of a circle of radius r
% a = the area of the circle of radius r
if r>=0
    a=pi*r^2;
    msg='Everithing is OK';
    imsg=1;
else
    msg='Error.The radius is a negative number';
    a=nan;
    imsg=0;
end