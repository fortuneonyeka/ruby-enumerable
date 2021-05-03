# Enumerable Module
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    arr = *self
    x = 0
    while x < arr.size
      yield(arr[x])
      x += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    my_each do |element|
      yield(element, i)
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    my_each do |i|
      arr << i if yield(i)
    end
    arr
  end

  def my_all?(arg = nil)
    return true if !block_given? && arg.nil?

    flag = true
    if block_given?
      my_each { |i| flag = yield(i) }
    elsif arg.instance_of?(Regexp)
      my_each { |i| flag = false unless arg.match(i) }
    else
      my_each { |i| flag = i.is_a?(arg) }
    end
    flag
  end

  def my_any?(arg = nil)
    return true if !block_given? && arg.nil?

    flag = false
    if block_given?
      my_each { |i| flag = yield(i) }
    elsif arg.instance_of?(Regexp)
      my_each { |i| flag = true if arg.match(i) }
    else
      my_each { |i| flag = i.is_a?(arg) }
    end
    flag
  end

  def my_none?(arg = nil)
    return true if !block_given? && arg.nil?

    flag = false
    if block_given?
      my_each { |i| flag = !yield(i) }
    elsif arg.instance_of?(Regexp)
      my_each { |i| flag = true unless arg.match(i) }
    else
      my_each { |i| flag = !i.is_a?(arg) }
    end
    flag
  end

  def my_count(arg = nil)
    count = 0
    if !arg.nil?
      my_each { |i| count += 1 if arg == i }
    elsif block_given?
      my_each { |i| count += 1 if yield(i) }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map(&arg)
    return to_enum(:my_map) unless block_given?

    arr = []
    my_each { |i| arr << arg.call(i) }
    arr
  end

  def my_inject(el1 = nil, el2 = nil)
    start = 0
    if el1.is_a?(Symbol) && !block_given?
      start = to_a[0]
      1.upto(to_a.length - 1) { |i| start = start.send(el1, to_a[i]) }
    elsif el2.is_a?(Symbol)
      start = el1
      0.upto(to_a.length - 1) { |i| start = start.send(el2, to_a[i]) }
    elsif el1.is_a?(Numeric) && block_given?
      start = el1
      my_each { |i| start = yield(start, i) }
    elsif block_given? && el1.nil?
      start = to_a[0]
      1.upto(to_a.length - 1) { |i| start = yield(start, to_a[i]) }
    end
    start
  end
end

def multiply_els(arr)
  arr.my_inject { |x, y| x * y }
end
