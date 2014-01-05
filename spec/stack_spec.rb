# tests for data-strucs/stack.rb

require '../lib/data-strucs/stack'

describe "stack" do
  before(:each) do
    @stack = Stack.new
  end

  it "should be empty when creating a new stack" do
    expect(@stack.size).to eq 0
    expect(@stack.peek).to be_nil
  end

  it "should have a size of 1 after pushing an element" do
    @stack.push(3)
    expect(@stack.peek).to eq 3
    expect(@stack.size).to eq 1
  end

  it "should return the value of a popped element" do
    @stack.push(3)
    val = @stack.pop
    expect(val).to eq 3
    expect(@stack.size).to eq 0
  end

end

describe "a stack created via an array argument" do
  before(:each) do
    @stack = Stack.new([3, 5, 6, 2, 8])
  end

  it "should have the correct size and top-most value" do
    expect(@stack.peek).to eq 8
    expect(@stack.size).to eq 5
  end

  it "should function correctly with Enumerable mixin functions" do
    expect(@stack.inject(:+)).to eq 24
  end

end
