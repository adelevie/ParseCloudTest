require "bundler/setup"
require "parse-ruby-client"
require 'test/unit'

Parse.init_from_cloud_code("config/global.json")

class Test::Unit::TestCase
end