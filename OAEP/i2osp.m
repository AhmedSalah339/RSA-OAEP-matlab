function out = i2osp(integer)
%returns unique endings for the mgf1 
out = join(['\x00\x00\x00\x0',num2str(integer)]);     
end