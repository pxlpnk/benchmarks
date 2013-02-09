Dir[File.dirname(__FILE__) + '/*.rb'].each do |file|
  require file
end

module RubyBenchmarks
  def self.time_method(method=nil, *args)
    beginning_time = Time.now
    if block_given?
      yield
    else
      self.send(method, args)
    end
    totaltime = (Time.now - beginning_time)*1000

    totaltime
  end
end
