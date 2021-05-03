require_relative 'enumerables'

my_hash = {}

# my_each
%w[apple pear coconut].my_each { |word| word }

# my_each_width_index
%w[apple pear coconut].my_each_with_index { |word, index|  "#{index} is #{word}" }
%w[apple pear coconut].my_each_with_index { |word, index| my_hash[word] = index }
p my_hash

# my_select
%w[satisfactory pear coconut beautiful no extra].my_select { |word| word.length > 4 }
[-5, 74, 2, 5, 10, 800].my_select { |num| (num.positive? && num.even?) }

# my_all?
%w[apple berry banana].my_all? { |word| word.length < 7 }
[-5, 74, 2, 5, 10, 800].my_all? { |num| (num.positive? && num.even?) }
%w[ant bear cat].my_all?(/t/)

# my_any?
%w[apple berry banana].my_any? { |word| word.length < 4 }
[-5, 74, 2, 5, 10, 800].my_any? { |num| (num.positive? && num.even?) }
['l', 4, nil].my_any?(Numeric)

# my_none?
%w[apple berry banana].my_none? { |word| word.length > 10 }
[-5, 74, 2, 5, 10, 800].my_none? { |num| num > 1000 }
%w[apple berry banana].my_none?(String)

# my_count
%w[apple berry banana].my_count { |word| word.length > 4 }
[-5, 74, 2, 5, 10, 800].my_count { |num| num > 20 }
[-5, -74, -5, -5, 10, -800].my_count(-5)

# my_map
%w[apple berry banana].my_map { |word| "fruit = #{word}" }
[-5, 74, 2, 5, 10, 800].my_map { |num| num * 20 }
(1..10).my_map { 'map' }

# my_inject
%w[apple berry banana].my_inject { |word, space| word + space }
[-5, 74, 2, 5, 10, 800].my_inject { |num1, num2| num1 + num2 }
[-5, 74, 2, 5, 10, 800].my_inject(:*)
[-5, 74, 2, 5, 10, 800].my_inject(3) { |num1, num2| num1 + num2 }

# multiply_els
multiply_els([1, 2, 3, 4])
