# frozen_string_literal: true

require_relative 'enumerables'

puts(%w[home game score].my_each { |x| x != 'game' })

# puts([30, 20, 50, 100].map {|x| x * x})
my_proc = Proc.new{|x| x + x}
puts([30, 20, 15, 70].my_map(&my_proc))
