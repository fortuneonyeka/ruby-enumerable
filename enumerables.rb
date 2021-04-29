# frozen_string_literal: true
# comment
module Enumerable
  def my_each
    x = 0
    while x < size
      yield(self[x])
      x += 1
    end
    self
  end

  # *******************************************
  def my_all?
    my_each do |x|
      return true if yield(x) == true
    end
    false
  end

  # my_any to return true **************************
  def my_any?
    my_each do |x|
      return true if yield(x) == true
    end
    false
  end
  # *************************************************

  def my_none?
    my_each do |x|
      return false if yield(x) == true
    end
    true
  end

  # my_count to return true *********************
  def my_count
    count = 0
    my_each do |x|
      count += 1 if yield(x) == true
    end
    count
  end
end