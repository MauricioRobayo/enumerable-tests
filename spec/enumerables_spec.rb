require_relative "../enumerable_methods.rb"

RSpec.describe Enumerable do
  describe "#my_each" do
    it "returns the same initial array" do
      test_array = [1, 2, 3]
      expect(test_array.my_each { |i| i }).to eql(test_array)
    end
    it "returns the same empty array" do
      test_array = []
      expect(test_array.my_each { |i| i }).to eql(test_array)
    end
  end
end
