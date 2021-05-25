require './enumerables'


describe Enumerable do
  let(:collegues) {%w["Mike", "John", "Shaw", "Jane"]}
  let(:array_strings) {["fan", "foul", "fond"]}
  let(:range) {(1..9)}
  let(:numbers) {[2, 5, 6, 9, 10, 13, 27, 50]}
  let(:arry) {[1, 3, 2, 7, 8]}

  describe "my_each" do
    it "returns an enumerator if no block or arguments is given" do
      expect([1, 3, 2, 7, 8].my_each).to be_a Enumerator
    end
    it "returns an array when a block is given" do
      expect([1, 3, 2, 7, 8].my_each{|x| x}).to eql(arry)
    end
  end

describe "my_each_with_index" do
  it "returns an enumerator if no block is given" do
    expect([1, 3, 2, 7, 8].my_each_with_index).to be_a Enumerator
  end
  it " returns an array with index when block is given" do
    expect([1, 3, 2, 7, 8].my_each_with_index{|x, i| x}).to eql(arry)
  end
end
describe "my_select" do
  it "returns an enumerator if no block is given" do
    expect([1, 3, 2, 7, 8].my_select). to be_a Enumerator
  end
  it "returns an array containing all elements to which the block given returns true" do
    expect([1, 3, 2, 7, 8].my_select(&:even?)).to eql([2, 8])
  end
end

describe "my_all?" do
  it "returns false when all provided argument are not of the same data type" do
    expect([1, 3, 2, "home", 8].my_all?(Numeric)).to eql(false)
  end
  it "returns true when array containing all elements to which the block or argument given returns true" do
    expect([1, 3, 2, 7, 8]. my_all?(Numeric)).to eql(true)
  end
  it "returns true when all the element in the array are string" do
    expect(["fan", "foul", "fond"].my_all?).to eq(true)
  end
end

describe "any?" do
  it "returns true when the object is not an array" do
    result = range.my_any?{|x| x > 7}
    expect(result).to eql(true)
  end
  it "when object is an array" do
    result = range.my_any?{|x| x == 12}
    expect(result).to eql(false)
  end
  end
end