# frozen string literal

# Iterative
# We want to know what number will be in the fibonacci sequence position excluding the 0
# Iterative solution allows to avoide the SystemStackError with bigger numbers

@memory = []
def fib_memoization_iterative(n)
  return @memory[n] if @memory[n]

  (0..n).each do |i|
    @memory[i] = i < 2 ? i : @memory[i-1] + @memory[i-2]
  end
  @memory[n]
end

p fib_memoization_iterative(7500)
