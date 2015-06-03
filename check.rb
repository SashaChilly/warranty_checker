require 'capybara'
require 'capybara/poltergeist'
require './device'
require './string'

include Capybara::DSL

Capybara.default_driver = :poltergeist
Capybara.ignore_hidden_elements = false

ARGV.each do |imei|
  Device.new(imei)
end