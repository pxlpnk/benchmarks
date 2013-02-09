require "ruby_benchmarks"

describe RubyBenchmarks do

  describe "time_method" do
    it "has a time_method" do
      RubyBenchmarks.must_respond_to :time_method
    end

    it "take a symbol as method name and calls it" do
      RubyBenchmarks.time_method :methods
    end

    it "takes a block end calls it" do
      RubyBenchmarks.time_method do
        1+1
      end
    end

    it "returns the total time in milliseconds" do
      totaltime = RubyBenchmarks.time_method :methods
      totaltime.must_be_instance_of Float
    end
  end
end
