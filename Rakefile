require "rubygems"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each{ |file| require file}
Dir.glob('tasks/*.rake').each { |r| import r }


task :default => [:test]

puts "ruby-version: #{RUBY_VERSION}"
case RUBY_VERSION
when "1.8.7"
  require 'rdoc/task'
else
  require 'rdoc/task'
end

  desc 'generate API documentation to doc/rdocs/index.html'
  Rake::RDocTask.new do |rd|
    rd.rdoc_dir = 'doc/rdocs'
    rd.main = 'README.md'
    #   rd.rdoc_files.include 'README.md' , 'CHANGELOG.txt', "config/**/*\.rb", "helpers/**/*\.rb", "script/**/*\.rb"a
    rd.rdoc_files.include 'README.md', "lib/*.rb"
    rd.options << '--inline-source'
    rd.options << '--line-numbers'
    rd.options << '--all'
    rd.options << '--fileboxes'
    rd.options << '--diagram'
end



require 'rake/testtask'
Rake::TestTask.new do |t|
  t.test_files = FileList[ "test/test_helper.rb", 'test/*_test.rb']
  t.verbose = true
end
