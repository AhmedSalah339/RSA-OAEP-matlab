function [c1,C] = OEABenc(M,n_bits,k0)
%performs OEB encoding

m = str2bin(M,(n_bits-k0));
r = random_string(k0);
%compute G(r)
g_hashed = mgf1(r,ceil((n_bits-k0)/8));
g_bin = str2bin(g_hashed,1);
%as r is a random string mgf1 fails to convert some 
%random strings to the required size so we insure the right size
while length(m) ~=  length(g_bin)
r = random_string(k0);
g_hashed = mgf1(r,ceil((n_bits-k0)/8));
g_bin = str2bin(g_hashed,1);
end
%X the first part of the messege
X = bitxor(m,g_bin);
X_char = char(bin2str(X));
%get H(X)
h_hashed = mgf1(X_char,k0/8);
h_bin = str2bin(h_hashed,k0);
r_bin = str2bin(r,k0);

Y = bitxor(r_bin,h_bin);
c1 = [X,Y];
%get binary string f the whole encoded messege and convert it to vpi number
%which is the final encoding
 C = num2str([X,Y]);
 C = (C(find(~isspace(C))));
 C = bin2vpi(C);
end