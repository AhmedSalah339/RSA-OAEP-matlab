function strf = bin2str(bin)
%if the array is not multiple of 8 ignore the first 
%charachters until it is divisible by 8 (for safty )
s = mod(length(bin),8);
bin = bin(s+1:end);
%convert the array to string of bits
str = num2str(bin);
str =(str(find(~isspace(str))));
%convert the bits to chars
str = char(bin2dec(reshape(str,8,[]).'));
strf = "";
%convert the chars array to string
strf = convertCharsToStrings(str);

end