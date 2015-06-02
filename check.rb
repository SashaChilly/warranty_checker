require 'capybara'
require 'capybara/poltergeist'

include Capybara::DSL

class String
  def info_between marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

Capybara.default_driver = :poltergeist
Capybara.ignore_hidden_elements = false

ARGV.each do |imei|
  visit "https://selfsolve.apple.com/agreementWarrantyDynamic.do"
  fill_in('sn', :with => imei)
  click_button('Continue')
  
  puts "============================================="
  puts "Information about warranty for imei #{imei}:"

  if !find('#error').text.empty?
  	puts find('#error').text
  elsif !find('#hardware-true').text.empty?
    puts find('#hardware-true').text
    puts find('#hardware-text').text.info_between(".", "Learn")
  else
    puts find('#hardware-false').text
  end
end
