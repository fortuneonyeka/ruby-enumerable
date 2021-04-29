# frozen_string_literal: true

require_relative "enumerables.rb"

#puts %w[home game score apple].my_count{ |x| x == "score"}
puts([1, 2, 7, 8, 9, 11].my_map { |x| x * 5 })
