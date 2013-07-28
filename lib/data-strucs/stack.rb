=begin
  A stack is a simple data structure similar to an array, except only the most recently added element
  is accessible. Elements are "pushed" onto the stack and "popped" off the top. This is sometimes referred
  to as "last in, first out" (LIFO).

  The simplicity of the data structure means that pushing and popping are O(1)
=end

require_relative "node"

class Stack
  include Enumerable
  attr_reader :size

  def initialize(ary = [])
    @front = nil
    @back = nil
    @size = 0
    ary.to_a.each { |element| push(element) }
  end

  def push(element)
    last_node = @back
    new_node = Node.new(element)
    last_node.right = new_node unless last_node.nil?
    new_node.left = last_node
    @front ||= new_node
    @size += 1
    @back = new_node
  end

  def pop
    return nil if @size == 0
    ret_val = @back.value
    @back = @back.left
    @back.right = nil unless @back.nil?
    @size -= 1
    return ret_val
  end

  # returns nil for empty stack, or the value of the element "on top"
  def peek
    return @back.nil? ? nil : @back.value
  end

  def each(&block)
    current_element = @back
    until current_element.nil?
      block.call(current_element.value)
      current_element = current_element.left
    end
  end

end