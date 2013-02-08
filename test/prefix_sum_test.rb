require "prefix_sum"

describe PrefixSum do
  describe "on creation" do
    before do
      @n = 10
      @p = PrefixSum.new(@n)
    end

    it "has a list of length n" do
      @p.list.length.must_equal @n
    end

    it "has 1..n elements with the id as value" do
      ref_list = (1..@n).to_a
      @p.list.must_equal ref_list
    end

    it "is of the type array" do
      @p.list.must_be_instance_of Array
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

  describe "benchmark" do

    before do
      @p = PrefixSum.new(10)
    end

    it "responds to benchmark" do
      @p.must_respond_to "benchmark"
    end

    it "returns the benchmark time as positive float" do
      benchmark = @p.benchmark :reduce
      benchmark.must_be_instance_of Float
      benchmark.must_be :>, 0
    end

    it "takes a function as symbol, calls it doesn't fail" do
      benchmark = @p.benchmark :reduce
    end
  end
end
