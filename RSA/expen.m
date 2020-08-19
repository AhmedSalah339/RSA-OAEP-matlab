function y = expen(x,n,m)
%helps with big exponents under modules as it keeps numbers small
%x^n mod(m)
%keep x smaller than m to be able to retrieve it in decryption
y = 1;
u = mod(x,m);
while n>0
   if mod(n,2) ==1
       y = mod((y*u),m);
   end
   if n>0
       n = floor(n/2);
   end
    u=mod((u*u),m);
end
end