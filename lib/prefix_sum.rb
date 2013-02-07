require 'benchmark'


class PrefixSum
  include Benchmark         # we need the CAPTION and FMTSTR constants

  attr_accessor :list, :length

  ##
  # n is the length of the list

  def initialize(n)
    self.length = n
    self.list = (1..n).to_a
  end


  ##
  # Using reduce(OPERATOR) do aggregate the list.
  # default ```+```

  def reduce(op = :+)
    self.list.reduce(op)
  end


  ##
  # Iterates with each over the list and is using an external accumulator.

  def iterate_reduce
    accu = 0
    self.list.each do |elem|
      accu = accu + elem
    end

    accu
  end


  ##
  # Prefix sum with inject

  def inject_reduce
    self.list.inject {|sum, n| sum + n }
  end

  ##
  # Run benchmark for all algorithms

  def benchmark
    benchmark = Benchmark.bmbm do |x|
      x.report("reduce")   { self.reduce }
      x.report("inject") { self.inject_reduce}
      x.report("iterate:")  { self.iterate_reduce}
    end
    benchmark
  end
end
