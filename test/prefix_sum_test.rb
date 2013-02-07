require "prefix_sum"

describe PrefixSum do
  describe "on creation" do

    before do
      @n = 10
      @p = PrefixSum.new(@n)
    end

    it "has a list of length n" do
      @p.length.must_equal @n
    end

    it "has 1..n elements with the id as value" do
      ref_list = (1..@n).to_a
      @p.list.must_equal ref_list
    end

    it "is of the type array" do
      @p.list.class.must_equal Array
    end
  end

end
