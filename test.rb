require_relative 'enumerables'

my_hash = {}

# my_each
puts '-----my_each-----'
puts(%w[apple pear coconut].my_each { |word| word })

# my_each_width_index
puts '-----my_each_with_index-----'
(%w[apple pear coconut].my_each_with_index { |word, index| puts "#{index} is #{word}" })
puts "\n"
%w[apple pear coconut].my_each_with_index { |word, index| my_hash[word] = index }
puts my_hash

# my_select
puts '-----my_select-----'
puts(%w[satisfactory pear coconut beautiful no extra].my_select { |word| word.length > 4 })
puts "\n"
puts([-5, 74, 2, 5, 10, 800].my_select { |num| (num.positive? && num.even?) })

# my_all?
puts '-----my_all?-----'
puts(%w[apple berry banana].my_all? { |word| word.length < 7 })
puts([-5, 74, 2, 5, 10, 800].my_all? { |num| (num.positive? && num.even?) })

# my_any?
puts '-----my_any?-----'
puts(%w[apple berry banana].my_any? { |word| word.length < 4 })
puts([-5, 74, 2, 5, 10, 800].my_any? { |num| (num.positive? && num.even?) })

# my_none?
puts '-----my_none?-----'
puts(%w[apple berry banana].my_none? { |word| word.length > 10 })
puts([-5, 74, 2, 5, 10, 800].my_none? { |num| num > 1000 })

# my_count
puts '-----my_count-----'
puts(%w[apple berry banana].my_count { |word| word.length > 4 })
puts([-5, 74, 2, 5, 10, 800].my_count { |num| num > 20 })

# my_map
puts '-----my_map----'
puts(%w[apple berry banana].my_map { |word| "fruit = #{word}" })
puts "\n"
puts([-5, 74, 2, 5, 10, 800].my_map { |num| num * 20 })

# my_inject
puts '-----my_inject----'
puts(%w[apple berry banana].inject { |word, space| word + space })
puts "\n"
puts([-5, 74, 2, 5, 10, 800].reduce { |num1, num2| num1 + num2 })

# multiply_els
puts '-----multiply_els----'
puts multiply_els([1, 2, 3, 4])
