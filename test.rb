require_relative 'enumerables'

# my_all?
# %w[apple berry banana].my_any? { |word| word.length < 7 }
# [-5, 74, 2, 5, 10, 800].my_none? { |num| (num.positive? && num.even?) }
%w[y y y].my_none?(/i/)
