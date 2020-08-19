function output = mgf1(input_str,length)
%encodes the string using sha256 and insures a certain string length
counter = 0;
output = '';
while size(output,2) < length
   %get unique ending
   C = i2osp(counter);
  %concatenate it to the input
   C= join([input_str,C]);
   %get the encoding for the new formed string and add it to the whole
   %encoding
   sha256hasher = System.Security.Cryptography.SHA256Managed;
   d = char(uint8(sha256hasher.ComputeHash(uint8(C))));
   output = join([output,d]) ;
   counter = counter+1;
end
%cut any residuals from the final iteration
output = output(1:length);
end