require_relative "../enumerable_methods.rb"



RSpec.describe Enumerable do
  let(:test_array) {[1,2,3,2]}
  describe "#my_each" do
    it "returns the same initial array" do
      expect(test_array.my_each { |i| i }).to eql(test_array)
    end
    it "returns the same empty array" do
      test_array = []
      expect(test_array.my_each { |i| i }).to eql(test_array)
    end
  end

  describe "#my_each_with_index" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_each_with_index {|index, item| index, item}).to eql([0,1,2,3],)
    end  
  end

  describe "#my_select" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_select {|item| item > 2}).to eql([3])
    end  
  end
  
  describe "#my_all?" do
    it "return true" do
      expect(test_array.my_all? {|i| i >= 0 }).to eql(true)
    end  
  end

  describe "#my_any?" do
    it "return true if one number match the condition" do
      expect(test_array.my_any? { |i| i >= 0 }).to eql(false)
    end  
  end

  describe "#my_none?" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_none? { |i| i == 5 }).to eql(true)
    end  
  end

  describe "#my_count" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_count { |i| i == 2 }).to eql(2)
    end  
  end

  describe "#my_map" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_map { |i| i * 5 }).to eql([5,10,15,20],)
    end  
  end

  describe "#my_inject" do
    it "return the same array with the corresponding indexes" do
      expect(test_array.my_inject { |accumulator, i| accumulator + i }).to eql(10)
    end  
  end

end
