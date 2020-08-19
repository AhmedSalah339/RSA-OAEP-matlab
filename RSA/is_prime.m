function b =is_prime(p)

b = false;
%fermat's little therom
a = randint(p-2-2,[1,1]); 
if expen(a,p-1,p) == 1
%then it may be a prime

%now check for all numbers from 2 to the
%root of our probable prime to see if it divisible by any   
  limit = p^0.5;
  [limit,~]=nthroot(p,2);
  i=1;
  %work around as vpis doesn't work with : operators
  while i ~=ceil(limit)-1
  numbers(i) = i+1;
  i=i+1;
  end
  
  n=2;
  c = 1;
  while mod(p,n)~=0 && c~=length(numbers)
      n=numbers(c);
      c = c+1;
  end

  if c==length(numbers)
       b=true;
      return 
  end

  end
    
end
