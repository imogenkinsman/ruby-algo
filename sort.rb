require 'benchmark'

num_array = []

11.times do
  num_array << rand(100)
end

# this is O(n * n!), which is impressively bad
def bogosort(num_array)
  sorted_array = num_array.dup.sort!
  while num_array !=  sorted_array
    num_array.shuffle!
  end
end

Benchmark.bm do |bm|
  bm.report('bogosort') do
    bogosort(num_array)
  end
end
