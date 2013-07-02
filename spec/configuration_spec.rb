# Encoding: utf-8

require 'selenium-connect/configuration'

describe SeleniumConnect::Configuration do

  VALID_JAR = 'test.jar'
  VALID_HOST = '111.000.111.000'
  VALID_SAUCE_USERNAME = 'test_user_name'

  before :each do
    @configuration = SeleniumConnect::Configuration.new
  end

  it 'can be populated by a hash' do
    @configuration.populate_with_hash jar: VALID_JAR, host: VALID_HOST
    @configuration.jar.should eq VALID_JAR
    @configuration.host.should eq VALID_HOST
  end

  it 'can be populated with a yaml file' do
    @configuration.populate_with_yaml "#{Dir.pwd}/spec/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'supports the config_file= method' do
    @configuration.config_file= "#{Dir.pwd}/spec/example.yaml"
    @configuration.sauce_username.should eq VALID_SAUCE_USERNAME
  end

  it 'should throw an exception for unsupported config variable' do
    expect do
      @configuration.hash = { bad: 'config-value' }
    end.to raise_error NoMethodError
  end

  it 'sensible defaults persist when nothing is set' do
    @configuration.host.should eq     'localhost'
    @configuration.port.should eq     4444
    @configuration.browser.should eq  'firefox'
  end
end