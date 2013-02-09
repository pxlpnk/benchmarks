class MatrixVectorMultiplication

  attr_accessor :matrix, :vector, :m, :n, :v

  def initialize(m, n, v)
    self.m = m
    self.n = n
    self.v = v
    self.vector = (1..v).to_a
    self.matrix = []
    init = 1

    # XXX: brrr ugly code is ugly
    (0..(self.m - 1)).each do |row|
      vector = []
      (1..self.n).each do |column|
        vector << init
        init = init + 1
      end
      self.matrix[row] = vector
    end
    init = 1
  end


  def product
    result = []
    self.matrix.each do |row|
      res_l = 0
      row.zip(self.vector).each do |m,v|
        res_l = res_l + (  m * v )
      end
      result << res_l
    end
    result
  end

  def benchmark(function)
    RubyBenchmarks.time_method do
      self.send(function)
    end
  end
end
