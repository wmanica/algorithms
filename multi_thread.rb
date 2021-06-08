# frozen string literal

# Based on https://jonathan-wong.medium.com/what-is-global-interpreter-lock-in-relation-to-ruby-18d0f4f20e20 credits
# all to him. Just added to ypo corrections on each of the implementations

# WITH MULTI THREAD RESULT MAY VARY
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

# WITHOUT MULTI THREAD RUNS AS EXPECTED
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