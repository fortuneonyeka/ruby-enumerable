# frozen_string_literal: true

require_relative "enumerables.rb"

puts %w[home game score].my_each{ |x| x != "game"}

