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
    ret_array = []
    until left.empty? or right.empty?
        (left.first <=> right.first) == -1 ? ret_array << left.shift : ret_array << right.shift
    end
    return ret_array + left + right
  end

  # much better - this is O(nlogn) performance even for worst case
  def mergesort(num_array)
    if num_array.length <= 1
      return num_array
    end
    left, right = [], []
    middle = num_array.length / 2
    num_array.each_index do |i|
      if i < middle
        left << num_array[i]
      else
        right << num_array[i]
      end
    end
    left = mergesort(left)
    right = mergesort(right)
    return merge(left, right)
  end

  private :merge

end