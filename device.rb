class Device
  attr_accessor :imei

  def initialize(imei)
  	check_on_apple_website(imei)
  end

  def check_on_apple_website(imei)
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
end