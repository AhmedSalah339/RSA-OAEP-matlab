function c = get_co_prime(k)
%get random int that is coprime with k
c = randint(k,[1,1]);
while gcd2(c,k) ~=1 

c = randint(k,[1,1]);
end
end