# About

This is an example project demonstrating a basic testing setup for Parse Cloud Code. Tests are written in Ruby using Test::Unit (easily changed).

## Installation

There's no "one and done" way to install, but you can always just copy the relevant files into your application. Be sure to copy the `Rakefile` and everything in the `test` folder (and replace with your own tests!).

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

This setup uses [parse-ruby-client](http://github.com/adelevie/parse-ruby-client) to execute the cloud functions. The basic usage is:

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

And to run the tests:

```
$ rake test
Run options: 

# Running tests:

.

Finished tests in 0.616816s, 1.6212 tests/s, 1.6212 assertions/s.

1 tests, 1 assertions, 0 failures, 0 errors, 0 skips
```

### Questions

File an [issue](https://github.com/adelevie/ParseCloudTest/issues/new), [email](mailto:adelevie@gmail.com) me, or contact me on [Twitter](http://twitter.com/adelevie).