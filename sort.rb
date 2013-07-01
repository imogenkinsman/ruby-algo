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
      break if !continue_sort
    end
  end

  # another O(n^2) meh algo
  def insertionsort(num_array)

  end
end