function m2 = OEABdec(C,n_bits,k0)
%get the binary content from the encoding
C = vpi2base(C,2);
%when converting from the decimal to binary at encoding zeros at the end of
%the number are ignored so we get it back
if length(C) < n_bits
   C = [zeros(1,n_bits-length(C)),C]; 
end
%get x and y binary
X = C(1:(n_bits-k0));

Y = C((n_bits-k0)+1:end);
%get the random string back
X_char = char(bin2str(X));
h_hashed = mgf1(X_char,k0/8);
h_bin = str2bin(h_hashed,k0);
r_bin2 = bitxor(Y,h_bin);
r2 = bin2str(r_bin2);
%get the messege back
g_hashed = mgf1(char(r2),ceil((n_bits-k0)/8));
g_bin = str2bin(g_hashed,1);
m2_bin = bitxor(X,g_bin);
m2 = bin2str(m2_bin);
end