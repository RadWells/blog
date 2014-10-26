* `skip` - helps you keep the test output manageable. Make sure you remove the `skip` before you try to add a new test or you'll be surprised at how few tests you're running.

* Optional arguments - Ruby methods can take optional arguments. We have not covered this in class yet. It looks like this: `def method_name(options={})` and reads as such: "If nothing is provided, assign an empty hash to the variable options".

* `Time.new` - feel free to go look at the docs, run this in pry

* `to_s` - this is much simpler than the Familemur bit, there is basically no iteration required. Remember `\n`.

* `Tempfile` - ignore this. It's Ruby for "create a temporary file object". This allows you to run the tests without ending up with lots of files you don't care about.
