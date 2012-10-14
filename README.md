# About

This is an example project demonstrating a basic testing setup for Parse Cloud Code. Tests are written in Ruby using Test::Unit (easily changed).

## Guide

This project is experimental, but it would probably be best for files and test functions in the `test` folder to map one-to-one to files and cloud functions in the `cloud` folder.

Writing a test is easy. Let's say we want to test the following:

```javascript
Parse.Cloud.define('trivial', function(request, response) {
  response.success(request.params);
});
```

In `test`, create a file called `test_main.rb`. First we'll add some boilerplate:

```ruby
require 'helper'

class TestMain < Test::Unit::TestCase
  def test_trivial
    # test will go here
  end
end
```

I'm using [parse-ruby-client](http://github.com/adelevie/parse-ruby-client) to execute the cloud functions. The basic usage is:

```ruby
function = Parse::Cloud::Function.new("nameOfFunction")
function.call({"arguments" => "asHash", "getParsed" => "toJSON"})
```

Putting it all together:

```ruby
require 'helper'

class TestMain < Test::Unit::TestCase
  def test_trivial
    function = Parse::Cloud::Function.new("trivial")
    params = {"foo" => "bar"}
    result = function.call(params)
    assert_equal result, params
  end
end
```