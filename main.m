clc;
clear;
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
n_bits = encrypt(file_name,n,e,k0);
disp('done ');
%dycreption

disp('Start decryption... ');
decrypt(file_name,n,d,n_bits,n_bits,k0);
fprintf('decrypted');


