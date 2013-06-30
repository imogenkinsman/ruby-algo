require 'benchmark'

num_array = []

10000.times do
  num_array << rand(100)
end

# this is O(n * n!), which is impressively bad
def bogosort(num_array)
  sorted_array = num_array.dup.sort!
  while num_array !=  sorted_array
    num_array.shuffle!
  end
end

# O(n^2) worst case, though O(n) for already sorted arrays
def bubblesort(num_array)
  loop do
    continue_sort = false
    i = 0
    while i + 1 < num_array.size
      if num_array[i] > num_array[i + 1]
        continue_sort = true
        num_array[i], num_array[i + 1] = num_array[i + 1], num_array[i]
      end
      i += 1
    end
    break if !continue_sort
  end
end

Benchmark.bm do |bm|
  #not even worth benchmarking - a fairly small n won't (on average) complete before the sun consumes its available hydrogen
  #bm.report('bogosort') do
  #  bogosort(num_array)
  #end
  bm.report('bubblesort') do
    bubblesort(num_array.dup)
  end
end
