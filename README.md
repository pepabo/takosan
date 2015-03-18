# Takosan

[![Gem Version](https://badge.fury.io/rb/takosan.svg)](http://badge.fury.io/rb/takosan)
[![Build Status](https://travis-ci.org/pepabo/takosan.png?branch=master)](https://travis-ci.org/pepabo/takosan)

Ruby wrapper of Takosan

## Installation

Add this line to your application's Gemfile:

    gem 'takosan'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install takosan

## Usage

```ruby
Takosan.url = "http://irc.example.com:4649"
Takosan.channel = "#example"
Takosan.notice 'awesome comment'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/takosan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
