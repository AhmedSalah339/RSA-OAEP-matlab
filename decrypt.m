function decrypt(file_name,n,d,n_bits,n_bits2,k0)
%read the encryption
name = join([file_name,'_encrypted.txt']);

filepath = fullfile(path, name);
fileID = fopen(filepath,'r');
c = fscanf(fileID,'%c');
fclose(fileID);
%get the numbers
c = split(c);
for i =1:length(c)
k = vpi(c{i});
if length(k) ~=0
    c{i}=k;
end
end

%get the decoded messege and remove the additional spaces from the OAEP
%using the num of bits

%note: The number of bits is a feature of the encoding system for sure the n_bits2 
%is not a number that is shared between the two sides but it is simply the
%first number divisible by 8 smaller than n_bits which you can calculate
%like in the encrypt function

dec_mess = '';
num_spaces = ceil(mod(2*n_bits2,n_bits)/8);
for i =1:length(c)-1
%decode the chuncks and make the messege
k = expen(c{i},d,n);
k = OEABdec(k,n_bits,k0);
k = char(k);
k = k(num_spaces+1:end);
dec_mess = join([dec_mess,k]);
end
%write the results
name = join([file_name,'_decrypted.txt']);
filepath = fullfile(path, name);
disp(filepath);
[fid, msg] = fopen(filepath,'wt+');
if fid == -1
  error(['Cannot open file: %s', char(10), '  %s'], filepath, msg);
end
disp(dec_mess);
fprintf(fid,'%s',dec_mess);
fclose(fid);
end
