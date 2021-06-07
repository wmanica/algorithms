# To calculate the factorial of a number we to multiply the sequence of numbers from 1 to the target
# For example, the factorial of 5 is: 1 * 2 * 3 * 4 * 5 = 120.

def iterative_factorial(n)
    (1..n).inject(:*)
end
  
def recursive_factorial(n)
    return 1 if n <= 1
    n * recursive_factorial(n-1)
end

p iterative_factorial(10)
p recursive_factorial(10)