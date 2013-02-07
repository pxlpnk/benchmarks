require "benchmarks"

describe Benchmarks do

  describe "time_method" do
    it "has a time_method" do
      Benchmarks.must_respond_to :time_method
    end

    it "take a symbol as method name and calls it" do
      Benchmarks.time_method :methods
    end

    it "takes a block end calls it" do
      Benchmarks.time_method do
        1+1
      end
    end

    it "returns the total time in milliseconds" do
      totaltime = Benchmarks.time_method :methods
      totaltime.must_be_instance_of Float
    end
  end
end
