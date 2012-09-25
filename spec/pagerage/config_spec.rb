require 'spec_helper'

describe Pagerage::Config do
  describe 'env!' do
    it 'should return the value of an environment variable if it exists' do
      ENV.stub(:[]).with('foo') { 'bar' }
      Pagerage::Config.env!('foo').should eq('bar')
    end

    it 'should raise an exception if the environment variable does not exist' do
      lambda { Pagerage::Config.env!('foo') }.should raise_error
    end
  end
end
