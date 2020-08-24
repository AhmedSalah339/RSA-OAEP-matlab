function n_bits = encrypt(path,file_name,n,e,k0)
% read the messege
fileID = fopen(join([file_name,'.txt']),'r');
M = fscanf(fileID,'%c');
fclose(fileID);
%get the closest number divisible by 8 to n_bits
n2 = vpi2bin(n);
for i=length(n2):-1:1
    if mod(i,8)==0
n_bits = i;
break;
    end
end

Ms=chunck(M,n_bits-k0);
%encrypt the chuncks and integrate them in one string
C ='';
for i=1:length(Ms)
[c1,m] = OEABenc(Ms{i},n_bits,k0);

m = expen(m,e,n);
%retrive the number from the vpi as array and convert it to string
m = struct(m);
m = m.digits;
m = m(length(m):-1:1);
m = num2str(m);
m = m(find(~isspace(m)));
C = join([C,m]);
C = join([C,' ']);

end

%write the results
name = join([file_name,'_encrypted.txt']);

filepath = fullfile(path, name);

[fid, msg] = fopen(filepath,'w');
disp(filepath);
if fid == -1
  error(['Cannot open file: %s', char(10), '  %s'], filepath, msg);
end

fprintf(fid,'%c',C);
fclose(fid);
end
