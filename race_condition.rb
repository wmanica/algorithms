# Based on https://jonathan-wong.medium.com/what-is-global-interpreter-lock-in-relation-to-ruby-18d0f4f20e20 credits all to him.
# Just typo corrections on each of the implementations 

# DUE Global Locker Implementation 
# Run several times, you’d get several different outputs. This is an example of race condition. Because of this, this makes the code unreliable.
@counter = 0

def read_counter
    @counter
end

def increment(value)
    @counter = value
end

100.times.map do
    Thread.new do
        10000.times do
            value = read_counter
            value = value + 1
            increment(value)
        end
    end
end.each(&:join)

puts @counter


# Run several times, you’d get every time 1_000_000
@counter = 0

100.times.map do
    Thread.new do
        10000.times do
            value = @counter
            value = value + 1
            @counter = value
        end
    end
end.each(&:join)

puts @counter