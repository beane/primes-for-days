# the logic is as follows:
# start with a list of primes (containing only the number 2)
# start with a candidate prime (3)
# until we have n primes
#    if the candidate is divisible by none of the known primes 
#    then include the candidate in the primes list
#
#    set the next candidate to be candidate += 2 (the next smallest possible prime)
#
# an optimization shortens our search a bit: 
# a number's smallest prime factor must be less than 
# its square root (unless the number is prime).
# so if we can't find any prime factors smaller than
# its square root, it must be prime and we can stop the search
# short proof: http://math.stackexchange.com/a/102760

def get_n_primes(n)
  return [] if n < 1
  primes = [2]
  candidate = 3

  while primes.length < n
    is_prime = true # default assume the number is prime
    primes.each do |prime|
      if candidate % prime == 0
        is_prime = false
        break
      end

      break if prime >= Math.sqrt(candidate)
    end

    primes << candidate if is_prime
    candidate += 2
  end

  primes
end

if __FILE__ == $PROGRAM_NAME
  primes = get_n_primes(10)

  printf "\t"
  puts primes.join("\t")

  primes.each do |prime|
    printf("#{prime}")
    primes.each do |p2|
       printf("\t#{p2 * prime}")
    end
    puts
  end
end

