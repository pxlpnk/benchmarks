Dir[File.dirname(__FILE__) + '/*.rb'].each do |file|
  require file
  #  require File.basename(file, File.extname(file))
end

require 'benchmark'
include Benchmark         # we need the CAPTION and FMTSTR constants


def benchmark(n = 1000)
  ps = PrefixSum.new(n)

  Benchmark.benchmark(" "*7 + CAPTION, 7, nil, ">total:", ">avg:") do |x|
    tf = x.report("reduce")   { ps.reduce }
    tt = x.report("inject") { ps.inject_reduce}
    tu = x.report("iterate:")  { ps.iterate_reduce}
    [tf+tt+tu, (tf+tt+tu)/3]
  end

  nil
end
