require 'helper'

class TestMain < Test::Unit::TestCase
	def test_trivial
		function = Parse::Cloud::Function.new("trivial")
		params = {"foo" => "bar"}
		result = function.call(params)
		assert_equal result, params
	end
end