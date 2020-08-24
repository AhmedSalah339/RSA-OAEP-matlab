clc;
clear;
path = matlab.desktop.editor.getActiveFilename;
path = path(1:length(path)-7);
path1 = join([path ,'/RSA']);
path2 = join([path ,'/OAEP']);
path3 = join([path ,'/Helper functions']);
%path4 = join([path ,'/VariablePrecisionIntegers/VariablePrecisionIntegers']);

addpath(path1); 
addpath(path2); 
addpath(path3); 
%addpath(path4); 
%number of p or q bits (must be bigger than 8)
n_bits_orig =19;
%k0 must be divisible by 8 because it is used to generate a rondom string
k0=8;
%get primes
%get the file
file_name = input('Enter the file name: ','s');
disp('Getting p and q ...');

p = get_prime(n_bits_orig);
q = get_prime(n_bits_orig);
while p==q
   q =  get_prime();
end
n = p*q;
k = (p-1)*(q-1);

disp('Getting e and d ...');
e = get_co_prime(k);
[~,d,~] = ext_gcd(e,k);
if d<0
  d = d+k;  
end

%encryption
disp('Start encryption...');
n_bits = encrypt(path,file_name,n,e,k0);
disp('done ');
%dycreption

disp('Start decryption... ');
decrypt(path,file_name,n,d,n_bits,n_bits,k0);
fprintf('decrypted');


