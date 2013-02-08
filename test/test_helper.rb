require 'minitest/spec'
require 'minitest/ansi'
require 'minitest/autorun'
require 'minitest/matchers'
require 'minitest/growl_notify'


if ENV['COVERAGE']
    require 'simplecov'
  SimpleCov.start do
    add_filter '/test/'
    add_group 'Libraries', 'lib'
  end
end

MiniTest::ANSI.use!
