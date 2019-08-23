# frozen_string_literal: true

require_relative '../enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:numbers_array) { [1, 2, 3, 2] }
  let(:strings_array) { %w[a b c d] }
  let(:empty_array) { [] }

  describe '#my_each' do
    it 'returns the same initial numbers array' do
      expect(numbers_array.my_each { |i| i }).to eql(numbers_array)
    end
    it 'returns the same initial empty array' do
      expect(empty_array.my_each { |i| i }).to eql(empty_array)
    end
    it 'returns the same initial strings array' do
      expect(strings_array.my_each { |i| i }).to eql(strings_array)
    end
  end

  describe '#my_select' do
    it 'return an array with just the items greater than 2' do
      expect(numbers_array.my_select { |item| item > 2 }).to eql([3])
    end
    it 'return an empty array when an empty array is given' do
      expect(empty_array.my_select { |item| item > 2 }).to eql([])
    end
    it 'return an array with items i equal to a' do
      expect(strings_array.my_select { |item| item == "a" }).to eql(["a"])
    end
    
  end

  describe '#my_all?' do
    it 'return true if all the elements are greater or equall than 0' do
      expect(numbers_array.my_all? { |i| i >= 0 }).to eql(true)
    end
    it 'return true if there is not elements in the array' do
      expect(empty_array.my_all? { |i| i >= 0 }).to eql(true)
    end
    it 'return false if all the array elemnts are iqual to b' do
      expect(strings_array.my_all? { |i| i == "b" }).to eql(false)
    end
  end

  describe ' #my_any?' do
    it 'return true if at least one number match the condition' do
      expect(numbers_array.my_any? { |i| i >= 0 }).to eql(true)
    end
    it 'return false when we have an empty array' do
      expect(empty_array.my_any? { |i| i >= 0 }).to eql(false)
    end
    it 'return true if at least one character match the condition' do
      expect(strings_array.my_any? { |i| i >= "a" }).to eql(true)
    end

  end

  describe ' #my_none?' do
    it 'return true if no item is equal to five' do
      expect(numbers_array.my_none? { |i| i == 5 }).to eql(true)
    end
    it 'return true if no item' do
      expect(empty_array.my_none? { |i| i == 5 }).to eql(true)
    end
    it 'return true if no item is equal to a' do
      expect(strings_array.my_none? { |i| i == "a" }).to eql(false)
    end
  end

  describe ' #my_count' do
    it 'return the number of times the element 2 is in the array' do
      expect(numbers_array.my_count { |i| i == 2 }).to eql(2)
    end
    it 'return the number of times the element 2 and a is in the array' do
      expect([1,6,3,2,6,"a","b"].my_count { |i| i == 2 || i == "a"}).to eql(2)
    end
    it 'return the number of times that true is not in the array' do
      expect([true].my_count { |i| i != false }).to eql(1)
    end
  end

  describe ' #my_map' do
    it 'return a new array with the items multiplied by 5' do
      expect(numbers_array.my_map { |i| i * 5 }).to eql([5, 10, 15, 10])
    end
    it 'return a new array with the items multiplied by 5' do
      expect([12,5*"a"].my_map { |i| i * 5 }).to eql([60, "aaaaaaaaaaaaaaaaaaaaaaaaa"])
    end
    it 'return a new array with the items operated with and and true' do
      expect([true, false, false].my_map { |i| i && true }).to eql([true, false, false])
    end
  end

  describe ' #my_inject' do
    it 'return the sum of the elements of the array' do
      expect(numbers_array.my_inject { |accumulator, i| accumulator + i }).to eql(8)
    end
    it 'return the sum of the elements of the array' do
      expect(empty_array.my_inject { |accumulator, i| accumulator + i }).to eql(8)
    end
    it 'return the sum of the elements of the array' do
      expect([true,true,false,false,true,false].my_inject { |accumulator, i| accumulator + i }).to eql(8)
    end
  end
end
