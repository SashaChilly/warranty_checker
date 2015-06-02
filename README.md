# WarrantyChecker

WarrantyChecker is a simple Ruby script to check ios device warranty status.

## Setup

WarrantyChecker requires Ruby 1.9.3 or later

To set it up just clone this repository, open terminal.app and move to cloned directory.

Also you need to install few gems:

Install Capybara
```ruby
gem install capybara
```
Install Poltergeist
```ruby
gem install poltergeist
```
Install phantomjs
```ruby
brew install phantomjs
```
To get info about warranty just run in console:

```ruby
ruby check.rb <imei1> <imei2> <imei3>
```

It accepts one or more imei numbers. You'll see the output just right in the console.