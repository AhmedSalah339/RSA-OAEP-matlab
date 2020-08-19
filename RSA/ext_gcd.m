function [d,a,b] = ext_gcd(x,y) 
if y==0
    d = x;
    a= 1;
    b = 0;
else
    [d,a,b] = ext_gcd(y,mod(x,y)) ;
    c = a;
    a = b; 
    b = c - floor(x/y)*b;
end
end