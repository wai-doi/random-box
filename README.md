# RandomBox

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/random_box`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_box'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_box

## Usage

### initialize
You can give Array and Range and Hash seed for Box#new argument.

```ruby
require 'random_box'

# seed = [:a, :b, :a, :z]
# seed = 1..100
seed = {winning: 5, losing: 20}

box = RandomBox::Box.new(seed)

p box.contents_data
# => {:losing=>{:number=>20, :percent=>80.0}, :winning=>{:number=>5, :percent=>20.0}}
```

### show_table
You can see a table of the box data.

```ruby
box.show_table

# console
Item     Number    Percent
--------------------------------
losing       20       80.0
winning       5       20.0
```

### add
You can add items in the box.

```ruby
box.add({jackpot: 1})

box.show_table

# console
Item     Number    Percent
--------------------------------
losing       20    76.9231
winning       5    19.2308
jackpot       1     3.8462
```

### draw
You can draw items from the box.

```ruby
p box.draw
#=> [:losing]

p box.draw(3)
#=> [:winning, :winning, :losing]

box.show_table
# console
Item     Number    Percent
--------------------------------
losing       18    81.8182
winning       3    13.6364
jackpot       1     4.5455
```

You can draw and return itmes in the box.

```ruby
p box.draw(3, back: true)
#=> [:losing, :losing, :losing]

box.show_table
# console
Item     Number    Percent
--------------------------------
losing       18    81.8182
winning       3    13.6364
jackpot       1     4.5455
```

### history
You can see your draw history.

```ruby
p box.history
# => [:losing, :winning, :winning, :losing, :losing, :losing, :losing]
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/random_box.
