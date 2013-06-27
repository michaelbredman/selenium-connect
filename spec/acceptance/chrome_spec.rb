require 'selenium-connect'
require_relative 'helper'

describe "Chrome" do

  let(:google)  { Google.new(SeleniumConnect.start) }
  let(:quit)    { SeleniumConnect.finish }

  it "localhost" do
    #currently only works on Mac
    SeleniumConnect.configure do |c|
      c.browser = 'chrome'
    end
    google.visit
    google.page_title.should include("Google")
    quit
  end

end