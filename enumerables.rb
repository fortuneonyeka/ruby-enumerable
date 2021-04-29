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

  def my_all?
    flag = false
    my_each do |x|
      if yield(x)
        flag = true
      else
        flag = false
        break
      end
    end
    flag
  end

  def my_any?
    my_each do |x|
      return true if yield(x)
    end
    false
  end

  def my_none?
    my_each do |x|
      return false if yield(x)
    end
    true
  end

  def my_count
    count = 0
    my_each do |x|
      if block_given?
        count += 1 if yield(x)
      else
        count += 1 
      end
    end
    count
  end

  def my_map
    arr = []
    my_each do |i|
      if block_given?
        arr << yield(i)
      else
        arr = self 
      end
    end
    arr
  end
end