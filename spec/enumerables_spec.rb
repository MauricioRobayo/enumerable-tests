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
      expect(test_array.my_each_with_index {|index, item| index, item}).to eql(test_array,[0,1,2,3])
    end  


end
