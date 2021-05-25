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
end