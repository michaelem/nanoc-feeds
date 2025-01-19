# Nanoc::Feeds

A set of helpers for generating additional feeds in nanoc. Currenntly JSON and Atom feeds are supported.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add nanoc-feeds
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install nanoc-feeds
```

## Usage

To generate JSON and Atom feeds add this gem to your `Gemfile` and then include the module in your `lib/helpers.rb` file:

```ruby
use_helper Nanoc::Feeds::Helpers::Feeds
```

Now create a `feed.erb` in your content folder using the helper provided:
```erb
<%= feed articles: sorted_articles %>
```

Finally add the following to your `Rules` file:
```ruby
compile "/feed.erb" do
  filter :erb
  write "/feed.xml"
end

compile "/feed.erb", rep: :json do
  filter :erb
  write "/feed.json"
end
```

This will render a JSON (`feed.json`) and Atom (`feed.xml`) feed for your articles.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelem/nanoc-feeds.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
