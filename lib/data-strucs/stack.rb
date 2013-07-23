=begin
  A stack is a simple data structure similar to an array, except only the most recently added element
  is accessible. Elements are "pushed" onto the stack and "popped" off the top. This is sometimes referred
  to as "last in, first out" (LIFO).

  The simplicity of the data structure means that pushing and popping are O(1)
=end

class Stack
  include Enumerable

  def initialize(ary = [])
    @front = nil
    @back = nil
    @size = 0
    ary.to_a.each { |element| push(element) }
  end

  def push(element)

  end

  def pop

  end

  def peek

  end

  def size

  end

  def each(&block)
    @data_struc.reverse_each(&block)
  end

end