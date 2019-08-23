# frozen_string_literal: true

module Enumerable
  def my_each
    each do |i|
      yield i
    end
  end

  def my_each_with_index
    (0...size).my_each do |i|
      yield self[i], i
    end
  end

  def my_select
    arr = []
    my_each do |i|
      arr.push(i) if yield i
    end
    arr
  end

  def my_all?
    my_each do |i|
      return false unless yield i
    end
    true
  end

  def my_any?
    my_each do |i|
      return true if yield i
    end
    false
  end

  def my_none?
    my_each do |i|
      if block_given?
        return false if yield i
      elsif i.zero?
        return true
      else
        return false
      end
    end
    true
  end

  def my_count(repeated_num = nil)
    count = 0
    my_each do |i|
      if block_given?
        count += 1 if yield i
      else
        count += repeated_num.nil? || repeated_num == i ? 1 : 0
      end
    end
    count
  end

  def my_map
    arr = []
    my_each do |i|
      arr.push(yield i)
    end
    arr
  end

  def my_inject(value = 0)
    accumulator = self[0]
    drop(1).my_each do |i|
      accumulator = yield accumulator, i
    end
    accumulator + value
  end
end
