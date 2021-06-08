# frozen string literal

# Recursive
# We want to know what number will be in the fibonacci sequence position excluding the 0

# These will have a problem of exponentially O(2^n)

def fibonacci(num)
  return num if (0..1).include? num

  (fibonacci(num - 1) + fibonacci(num - 2))
end

f = ->(x) { x < 2 ? x : f[x - 1] + f[x - 2] }
# p fibonacci(10)
# p f[11]

# Solution will be to use Memoization

@cache = [0,1]
def fib_memoization(n)
  return @cache[n] if @cache[n]

  @cache[n] = fib_memoization(n-1) + fib_memoization(n-2)
end
# p fib_memoization(50)
