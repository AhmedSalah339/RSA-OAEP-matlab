function r = str2bin(str,k0)
%converts strings to array of bits 
%as every char is encoded in 8 bits
r = dec2bin(str,1).'-'0';
%make all incodings 8 bits to unify strings encoding
r = [zeros(8-size(r,1),size(r,2));r];
%concatenate all chars incodings to one array
r = reshape(dec2bin(r,1).'-'0',1,[]);

%insure that the binary array is k0 in size
s_r = size(r,2);
if s_r <k0
    r = [zeros(1,(k0)-s_r),r];
end


end