function g = gcd2(x,y)
%greatest common divider
if y==0
    g = x;
else
    g = gcd2(y,mod(x,y)) ;
end
end