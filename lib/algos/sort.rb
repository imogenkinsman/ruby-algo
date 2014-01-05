module Sort
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
      break unless continue_sort
    end
  end

  # another O(n^2) meh algo
  def insertionsort(num_array)
    num_array.each_index do |i|
      value = num_array[i]
      hole_position = i
      while hole_position > 0 and value < num_array[hole_position - 1]
        num_array[hole_position] = num_array[hole_position - 1]
        hole_position -= 1
      end
      num_array[hole_position] = value
    end
  end

  def merge(left, right)
    ary = []
    until left.empty? || right.empty?
        ary << ((left.first <=> right.first) == -1 ? left.shift :  right.shift)
    end
    return ary + left + right
  end

  # much better - this is O(nlogn) performance even for worst case
  def mergesort(ary)
    return ary if ary.length <= 1
    half = ary.size / 2
    left = ary[0...half]
    right = ary[half..-1]
    return merge(mergesort(left), mergesort(right))
  end

  private :merge

end
