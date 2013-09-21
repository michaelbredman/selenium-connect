# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/local_runner'

describe SeleniumConnect::Runner::LocalRunner do
  let(:runner) { SeleniumConnect::Runner::LocalRunner.new }

  it 'should respond to driver' do
    runner.should respond_to :driver
    runner.should respond_to :driver=
  end

  it 'should return itself when running a new job' do
    mock_job = double 'SeleniumConnect::Job'
    allow(mock_job).to receive(:run)
    runner.run(mock_job).should be_an_instance_of SeleniumConnect::Runner::LocalRunner
  end

  it 'should respond to finish' do
    runner.should respond_to :finish
  end
end
