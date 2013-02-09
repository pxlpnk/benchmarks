namespace :benchmark do

  require 'logger'
  @log = Logger.new(STDOUT)
  @log.level = Logger::DEBUG

  desc "Runs the benchmarks"
  task :all do
    @log.debug "Running all benchmarks"
    raise "Not yet implemented"
  end

  desc "Run matrix vector multiplication"
  task :matrix_vector_multiplication do
    imp = [:product]
    m = 200
    n = 200
    v = 200
    replay = 10
    @log.debug "Implementations: #{imp.inspect}, M: #{m}, N: #{n}, V: #{v} replays #{replay}"
    result = Hash.new{|h, k| h[k] = []}
    mv = MatrixVectorMultiplication.new(300, 200, 200)
    imp.each do |impl|
      (1..replay).each do |run|
        ps = PrefixSum.new(n)
        time = mv.benchmark(impl)
        result[impl] << time
        @log.debug "Benchmark time:#{impl},#{time}"
      end
    end
  end

  desc "Run prefix sum Benchmarks"
  task :prefix_sums do
    # imp = [:reduce, :inject_reduce, :iterate_reduce]
    imp = [:reduce]
    step = 10
    range = (step..100)
    ns = range.step(step)
    replay = 10

    result_data = Hash.new(Hash.new{|h, k| h[k] = []})

    ns.each do |n|
      @log.debug "Implementations: #{imp.inspect}, N: #{n}, replays #{replay}"
      ps = PrefixSum.new(n)
      imp.each do |impl|
        (1..replay).each do |run|
          time = ps.benchmark(impl)
          @log.debug "b_time:#{impl},#{time}"
          result_data[n][impl] << time
        end
      end
    end

    data = []
    imp.each do |impl|
      data = compute_graph(impl, ns, result_data)
    end

    p data
  end
end


def plot_graph(data)

end


def compute_graph(impl, ns, data, method = :median)
  result = []
  ns.each do |n|
    @log.debug "Compting run: #{n}, impl: #{impl}"
    result <<  {:x => n, :y => data[n][impl].send(method)}
  end
  result
end
