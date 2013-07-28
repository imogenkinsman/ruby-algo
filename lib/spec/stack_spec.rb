# tests for data-strucs/stack.rb

require '../data-strucs/stack'

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