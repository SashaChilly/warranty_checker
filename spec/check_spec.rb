require 'spec_helper'

describe 'check warranty' do
  def check_warranty(imei = nil)
  	Device.new(imei)
  end

  context "imei is invalid" do
  	it "shows an error message" do
  	  output = capture_stdout do
  	    check_warranty(1111)
  	  end

  	  expect(output).to include("Please enter a valid serial number.")
    end
  end

  context "imei is not provided" do
  	it "suggests to provide serial number" do
  	  output = capture_stdout do
  	    check_warranty()
  	  end

  	  expect(output).to include("Please enter your product's serial number.")
    end
  end

  context "imei is valid and warranty is active" do
  	it "shows the expiration date" do
  	  output = capture_stdout do
  	    check_warranty("013977000323877")
  	  end

  	  expect(output).to include("Estimated Expiration Date:")
    end
  end

  context "imei is valid but warranty is expired" do
  	it "shows the expiration date" do
  	  output = capture_stdout do
  	    check_warranty("013896000639712")
  	  end

  	  expect(output).to include("Coverage: Expired")
    end
  end
end
