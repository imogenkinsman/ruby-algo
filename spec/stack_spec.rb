# tests for data-strucs/stack.rb

require '../lib/data-strucs/stack'

describe "stack" do
  before(:each) do
    @stack = Stack.new
  end

  it "should be empty when creating a new stack" do
    @stack.size.should eql 0
    @stack.peek.should be_nil
  end

  it "should have a size of 1 after pushing an element" do
    @stack.push(3)
    @stack.peek.should eql 3
    @stack.size.should eql 1
  end

  it "should return the value of a popped element" do
    @stack.push(3)
    val = @stack.pop
    val.should eql 3
    @stack.size.should eql 0
  end

end

describe "a stack created via an array argument" do
  before(:each) do
    @stack = Stack.new([3, 5, 6, 2, 8])
  end

  it "should have the correct size and top-most value" do
    @stack.peek.should eql 8
    @stack.size.should eql 5
  end

  it "should function correctly with Enumerable mixin functions" do
    @stack.inject{|sum, element| sum + element }.should eql 24
  end

end
