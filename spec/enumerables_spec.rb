require './enumerables'

describe Enumerable do
  let(:range) { (1..9) }
  let(:arry) { [1, 3, 2, 7, 8] }

  describe 'my_each' do
    it 'returns an enumerator if no block or arguments is given' do
      expect([1, 3, 2, 7, 8].my_each).to be_a Enumerator
    end
    it 'returns an array when a block is given' do
      expect([1, 3, 2, 7, 8].my_each { |x| x }).to eql(arry)
    end
  end

  describe 'my_each_with_index' do
    it 'returns an enumerator if no block is given' do
      expect([1, 3, 2, 7, 8].my_each_with_index).to be_a Enumerator
    end
    it ' returns an array with index when block is given' do
      expect([1, 3, 2, 7, 8].my_each_with_index { |x, _i| x }).to eql(arry)
    end
  end
  describe 'my_select' do
    it 'returns an enumerator if no block is given' do
      expect([1, 3, 2, 7, 8].my_select).to be_a Enumerator
    end
    it 'returns an array containing all elements to which the block given returns true' do
      expect([1, 3, 2, 7, 8].my_select(&:even?)).to eql([2, 8])
    end
  end

  describe 'my_all?' do
    it 'returns false when all provided argument are not of the same data type' do
      expect([1, 3, 2, 'home', 8].my_all?(Numeric)).to eql(false)
    end
    it 'returns true when array containing all elements to which the block or argument given returns true' do
      expect([1, 3, 2, 7, 8].my_all?(Numeric)).to eql(true)
    end
    it 'returns true when all the element in the array are string' do
      expect(%w[fan foul fond].my_all?).to eq(true)
    end
  end

  describe 'any?' do
    it 'returns true when the object is not an array' do
      result = range.my_any? { |x| x > 7 }
      expect(result).to eql(true)
    end
    it 'when object is an array' do
      result = range.my_any? { |x| x == 12 }
      expect(result).to eql(false)
    end
  end
  describe 'my_none?' do
    it 'returns true if the block never returns true' do
      expect(%w[fan foul fond].my_none?(Numeric)).to eql(true)
    end
    it 'returns true if regex pattern never matches with the elements' do
      expect(%w[fan foul fond].my_none?(/w/)).to eql(true)
    end
    it 'returns false if at least one of the element matches or of the same class' do
      expect(['fan', 'foul', 20, 'fond'].my_none?(Numeric)).to eql(false)
    end
    it 'returns true if array is empty' do
      expect([].my_none?).to eql(true)
    end
    it 'returns true if an argument equals nil' do
      expect([nil].my_none?).to eql(true)
    end
  end

  describe 'my_count' do
    it 'if block given' do
      expect(arry.my_count).to eql(5)
    end
    it 'return even numbers when block is given' do
      expect(arry.my_count(&:even?)).to eql(2)
    end
    it 'when block given' do
      result = arry.my_count { |x| x > 5 }
      expect(result).to eql(2)
    end
  end

  describe 'my_map' do
    it 'when block is given' do
      result = range.map { |x| x * x }
      expect(result).to eql([1, 4, 9, 16, 25, 36, 49, 64, 81])
    end
    it 'returns Enumerator when no block and proc is given' do
      expect(range.my_map).to be_a Enumerator
    end
  end

  describe 'my_inject' do
    it 'when block given' do
      result = (5..10).my_inject { |sum, n| sum + n }
      expect(result).to eql(45)
    end
    it 'when block has a method and an argument' do
      result = (1..3).my_inject(1) { |x, i| x * i }
      expected = (1..3).my_inject(1) { |x, i| x * i }
      expect(result).to eql(expected)
    end
  end
end
