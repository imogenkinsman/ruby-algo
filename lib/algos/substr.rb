module Substr
  # a naive method of substring searching
  # complexity is O(nm), where n is the length of the string and m is the length of the substring
  def naive(string, substring)
    start_index = 0
    #cur_index = 0
    while start_index < string.length
      k = 0
      match = true
      while k < substring.length
        if string[start_index + k] != substring[k]
          match = false
          break
        end
        k += 1
      end
      return start_index if match
      start_index += 1
    end
    return false
  end

# the excellent knuth-morriss-pratt algorithm, which runs in O(n+m)
  def kmp(text, pattern)
  # preprocess the pattern
  pos = 1
  failure_table = [0]
  compare = 0
  while pos < pattern.length
    failure_table << compare
    if pattern[pos] == pattern[compare]
      compare += 1
    else
      compare = 0
    end
    pos += 1
  end

  # match string
    pos = 0
    compare = 0
    while pos < text.length
      if text[pos] == pattern[compare]
        compare += 1
      else
        compare = failure_table[compare]
      end

      pos += 1
      if compare == pattern.length
        return pos - compare
      end
    end 
    return false
  end
end

