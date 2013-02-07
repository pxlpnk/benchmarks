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

  describe "as an algorithm" do
    before do
      @n = 10
      @p = PrefixSum.new(@n)
      @ref = @p.reduce
    end

    it "has a reduce function" do
      reference = 0
      @p.list.each {|elem| reference =  reference + elem }
      result = @p.reduce
      result.must_equal reference
    end

    it "has an iterate_reduce function" do
      result = @p.iterate_reduce
      result.must_equal @ref
    end

    it "has an inject_reduce function" do
      result = @p.inject_reduce
      result.must_equal @ref
    end
  end
end
