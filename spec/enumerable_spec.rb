require_relative '../enumerables'

describe Enumerable do
  describe '#my_each' do
    let(:check) { [1, 2, 3].my_each } # Variable to check if it returns Enumerator

    it 'Iterates through a series of elements of an array' do
      expect([1, 2, 3].my_each { |i| i }).to eq([1, 2, 3])
    end
    it 'Iterates through a series of elements of an range' do
      expect((1..3).my_each { |i| i }).to eq(1..3)
    end
    it 'Returns enumerator' do
      expect(check.is_a?(Enumerator)).to eq(true)
    end
  end

  describe '#my_each_with_index' do
    let(:hasx) { {} } # Empty hash
    let(:arr) { %w[Apple Cherry Orange] } # Empty array
    let(:check) { arr.my_each_with_index } # Variable to check if it returns Enumerator

    before 'Add keys and values to variable hasx' do # For later check if true
      arr.my_each_with_index { |i, v| hasx[i] = v }
    end
    it 'Iterates through an array' do
      expect(arr.my_each_with_index { |i, v| hasx[i] = v }).to eq(%w[Apple Cherry Orange])
    end
    it 'Returns Enumerator' do
      expect(check.is_a?(Enumerator)).to eq(true)
    end
    it 'Displays hash values and keys previously added' do
      expect(hasx).to eq({ 'Apple' => 0, 'Cherry' => 1, 'Orange' => 2 })
    end
  end

  describe '#my_select' do
    let(:arr) { [10, 11, 12, 14] } # Variable to check if it returns Enumerator
    let(:check) { arr.select(&:even?) } # Variable to compare original select to my_select

    it 'Returns numbers that are even' do
      expect([1, 2, 3, 4].my_select(&:even?)).to eq([2, 4])
    end
    it 'Returns numbers that are even using a range' do
      expect((1..10).my_select(&:even?)).to eq([2, 4, 6, 8, 10])
    end
    it 'Returns elements that match the pattern' do
      expect(%w[ox ant tree pant google chant].my_select { |i| i.match(/ant/) }).to eq(%w[ant pant chant])
    end
    it 'Returns the same as select' do
      expect(arr.my_select(&:even?)).to eq(check)
    end
  end

  describe '#my_all?' do
    it 'Returns true if all elements are odd' do
      expect([11, 13, 1, 7, 9].my_all?(&:odd?)).to eq(true)
    end
    it 'Returns false if no element is Numeric' do
      expect(%w[11 13 1 7 9].my_all?(Numeric)).to eq(false)
    end
    it 'Returns false if any element does not match the pattern' do
      expect(%w[ox ant tree pant google chant].my_all? { |i| i.match(/ant/) }).to eq(false)
    end
    it 'Returns true if all elements are larger than 10' do
      expect([11, 15, 75, 110].my_all? { |i| i > 10 }).to eq(true)
    end
    it 'Returns false if any element does not match the argument' do
      expect([11, 15, 75, 110].my_all?(15)).to eq(false)
    end
    it 'Returns false if any element does not match the argument' do
      expect(%w[ant chant pant sun].my_all?(/ant/)).to eq(false)
    end
    it 'Returns true if array is empty' do
      expect([].my_all?).to eq(true)
    end
    it 'Returns false if any element is nil or false' do
      expect([true, nil, 8].my_all?).to eq(false)
    end
    it 'Returns error if no element provided' do
      expect { my_all?(Numeric) }.to raise_error(NoMethodError)
    end
  end

  describe '#my_any?' do
    it 'Returns false if no element is odd' do
      expect([8, 2, 10, 14, 70].my_any?(&:odd?)).to eq(false)
    end
    it 'Returns true if any element is Numeric' do
      expect(['apple', nil, 5, nil].my_any?(Numeric)).to eq(true)
    end
    it 'Returns true if any element matches the pattern' do
      expect(%w[ox ant tree pant google chant].my_any? { |i| i.match(/ant/) }).to eq(true)
    end
    it 'Returns true if any element is larger than 10' do
      expect([-11, 0, 75, 110].my_any? { |i| i > 10 }).to eq(true)
    end
    it 'Returns false if no element matches the argument' do
      expect([11, 20, 75, 110].my_any?(15)).to eq(false)
    end
    it 'Returns true if any element matches the argument' do
      expect(%w[ant chant pant sun].my_any?(/ant/)).to eq(true)
    end
    it 'Returns false if array is empty' do
      expect([].my_any?).to eq(false)
    end
    it 'Returns false if any element is empty' do
      expect([nil, nil, false].my_any?).to eq(false)
    end
    it 'Returns error if no element provided' do
      expect { my_any?(Numeric) }.to raise_error(NoMethodError)
    end
  end

  describe '#my_none?' do
    it 'Returns true if all elements are not odd' do
      expect([8, 2, 10, 14, 70].my_none?(&:odd?)).to eq(true)
    end
    it 'Returns true if all elements are not Numeric' do
      expect(%w[apple cidre orange].my_none?(Numeric)).to eq(true)
    end
    it 'Returns false if all elements match the pattern' do
      expect(%w[ant chant pant].my_none? { |i| i.match(/ant/) }).to eq(false)
    end
    it 'Returns true if all elements are not larger than 10' do
      expect([-11, 0, 5, 1].my_none? { |i| i > 10 }).to eq(true)
    end
    it 'Returns false if all elements match the argument' do
      expect([15, 15, 15, 15].my_none?(15)).to eq(false)
    end
    it 'Returns true if all elements don\'t match the argument' do
      expect(%w[ox fenix carol sun].my_none?(/ant/)).to eq(true)
    end
    it 'Returns true if array is empty' do
      expect([].my_none?).to eq(true)
    end
    it 'Returns false if any elements are true' do
      expect([nil, true, false].my_none?).to eq(false)
    end
    it 'Returns error if no element provided' do
      expect { my_none?(Numeric) }.to raise_error(NoMethodError)
    end
  end

  describe '#my_count' do
    it 'Counts the elements in an array' do
      expect([1, 2, 3, 4, 5].my_count).to eq(5)
    end
    it 'Counts the elements in an range' do
      expect((1..100).my_count).to eq(100)
    end
    it 'Counts the elements that are equal to the argument' do
      expect([2, 4, 2, 3, 2, 5].my_count(2)).to eq(3)
    end
    it 'Counts the elements that are even in the array' do
      expect([2, 4, 2, 3, 2, 5].my_count(&:even?)).to eq(4)
    end
    it 'Counts the elements that are multiples of 5' do
      expect([15, 5, 20, 3, 6, 25].my_count { |i| i % 5 == 0 }).to eq(4)
    end
    it 'Returns error if no element provided' do
      expect { my_count(2) }.to raise_error(NoMethodError)
    end
  end

  describe '#my_map' do
    it 'Returns an array with the product of each number by itself' do
      expect([1, 2, 3, 4].my_map { |i| i * i }).to eq([1, 4, 9, 16])
    end
    it 'Returns an array with the product of each number by itself using a range' do
      expect((5..10).my_map { |i| i * i }).to eq([25, 36, 49, 64, 81, 100])
    end
    it 'Returns an array with upper case words' do
      expect(%w[AppLe oRangE berrY].my_map(&:upcase)).to eq(%w[APPLE ORANGE BERRY])
    end
    it 'Returns error if no element provided' do
      expect { my_map { |i| i * i } }.to raise_error(NoMethodError)
    end
    it 'Returns error if no elements can\'t be multiply' do
      expect { %w[apple berry orange].my_map { |i| i * i } }.to raise_error(TypeError)
    end
  end

  describe '#my_inject' do
    it 'Adds up all the numbers in the range' do
      expect((5..10).my_inject(:+)).to eq(45)
    end
    it 'Adds up all the numbers in the array' do
      expect([0, 4, 5].my_inject(:+)).to eq(9)
    end
    it 'String together all the words' do
      expect(%w[apple orange berry].my_inject(:+)).to eq('appleorangeberry')
    end
    it 'Multiply all numbers to each other and then by 2' do
      expect([1, 2, 3, 4, 5].my_inject(2, :*)).to eq(240)
    end
    it 'Substract all numbers by each other and then 2' do
      expect([15, 15].my_inject(2) { |i, value| i - value }).to eq(-28)
    end
    it 'Return the longest word' do
      expect(%w[cat sheep bear].inject { |memo, word| memo.length > word.length ? memo : word }).to eq('sheep')
    end
    it 'Returns error if no element provided' do
      expect { my_inject { |i| i * i } }.to raise_error(NoMethodError)
    end
    it 'Returns error if no elements can\'t be multiply' do
      expect { %w[apple berry orange].my_inject { |i| i * i } }.to raise_error(TypeError)
    end
  end

  describe '#multiply_els' do
    it 'Multiplies all numbers in the array' do
      expect(multiply_els([1, 2, 3])).to eq(6)
    end
    it 'Multiplies all numbers in the range' do
      expect(multiply_els((1..3))).to eq(6)
    end
    it 'Returns error if no elements can\'t be multiply' do
      expect { multiply_els(%w[apple berry sunday]) }.to raise_error(TypeError)
    end
  end
end
