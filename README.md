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
    manager.browserid_url = "dev.diresworb.org"
  end
```

See the devise-browserid gem for client side action.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
