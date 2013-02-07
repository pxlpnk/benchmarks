Dir[File.dirname(__FILE__) + '/lib/*.rb'].each do |file|
  require file
end

require 'rdoc/task'


task :default => [:test]

desc "Runs the benchmarks"
task :benchmark do
  ps = PrefixSum.new(10000)
  ps.benchmark
end


desc 'generate API documentation to doc/rdocs/index.html'
Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'doc/rdocs'
  rd.main = 'README.md'
#  rd.rdoc_files.include 'README.md', 'CHANGELOG.txt', "config/**/*\.rb", "helpers/**/*\.rb", "script/**/*\.rb"

  rd.options << '--inline-source'
  rd.options << '--line-numbers'
  rd.options << '--all'
  rd.options << '--fileboxes'
  rd.options << '--diagram'
end
