# Warden::BrowserId

Authenticate your Warden-enabled app using BrowserID from Mozilla

## Installation

Add this line to your application's Gemfile:

    gem 'warden-browserid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install warden-browserid

## Usage

I use the warden-browserid strategy with Devise, configured like this in
config/initializers/devise.rb in Rails:

```ruby
  config.warden do |manager|
    manager.default_strategies(:scope => :user).unshift :browserid
  end
```
See the [Warden wiki] for other usage. The following option is
available, since [Mozilla] [1] says to use BrowserID as follows:
```ruby
    # manager.browserid_url = "dev.diresworb.org"  # Development
(default)
    # manager.browserid_url = "diresworb.org"      # Beta
    # manager.browserid_url = "browserid.org"      # Production
```

I use the [devise-browserid] gem
to enable client side action for BrowserID.

[1]: https://github.com/hassox/warden/wiki/Setup "Warden wiki"
[2]: https://github.com/ringe/devise-browserid "devise-browserid"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
