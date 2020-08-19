function chunked_m = chunck(M,n_bits)
%divde the messege to chuncks that contains number of bits <= n_bits
M = char(M);
n_chanks = ceil(8*length(M)/n_bits);
chunk_size =ceil(length(M)/n_chanks); 

chunked_m = [];
for  i=1:n_chanks
start = (i-1)*chunk_size+1;
final = min(start+chunk_size-1,length(M));
chunked_m{i} = M(start:final);
end


end