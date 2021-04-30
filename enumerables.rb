# Enumerable Module
module Enumerable
  def my_each
    x = 0
    while x < size
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    i = 0
    my_each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    arr = []
    my_each do |i|
      arr << i if yield(i)
    end
    arr
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

  def my_map(&proc)
    arr = []
    my_each do |x|
      arr << proc.call(x)
    end
    arr
  end

  def my_inject
    final = nil
    my_each do |i|
      final = if final.nil?
                i
              else
                yield(final, i)
              end
    end
    final
  end
end

def multiply_els(arr)
  arr.my_inject { |x, y| x * y }
end
