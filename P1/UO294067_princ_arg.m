function [a,b,phase,realphase] = UO294067_princ_arg(z)
% This function computes the principal argument of a complex number z,
% without using the order angle

a=real(z); % Real part of z
b=imag(z); % Imaginary part of z
phase=atan(b/a); % Phase of z

if (b>=0) && (a>=0) % First quadrant
    fprintf ("The argument of %.4f + %.4fi is %.8f",a,b,phase);
end

if (b>=0) && (a<0) % Second quadrant
    realphase=pi-phase;
    fprintf ("The argument of %.4f + %.4fi is %.8f",a,b,realphase);
end

if (b<0) && (a>=0) % Third quadrant
    realphase=pi+phase;
    fprintf ("The argument of %.4f + %.4fi is %.8f",a,b,realphase);
end

if (b<0) && (a<0) % Fourth quadrant
    realphase=-phase;
    fprintf ("The argument of %.4f + %.4fi is %.8f",a,b,realphase);
end