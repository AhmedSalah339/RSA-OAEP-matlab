function p =get_prime(n_bits)
%get n bits prime
n1=vpi(2)^(n_bits-1);
n2=vpi(2)^(n_bits);
% work around as vpis work only with randint
p = randint(n2,[1,1]);
%insure the prime in the required range
while p<n1
p = randint(n2,[1,1]);
end
%try until hit a prime
while ~is_prime(p)
    
    p = randint(n2,[1,1]);
    while p<n1
      p = randint(n2,[1,1]);
    end
    %for safety
    if p > n2    
        p = randint(n2,[1,1]);
        while p<n1
            p = randint(n2,[1,1]);
          end
    end
    
end
end