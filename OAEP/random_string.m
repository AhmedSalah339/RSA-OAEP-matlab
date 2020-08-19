function str = random_string(n_bits)
%gits a random n_bits string consists of pos chars and every char is a uint8 char
pos = '0123456789abcdefghijklmnobqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*()_+-*/= ;';

str ='';
k = floor(n_bits/8);
for i = 1:k
    n = randi([1,length(pos)]);
     str = join([str,uint8(pos(n))]);
end


end