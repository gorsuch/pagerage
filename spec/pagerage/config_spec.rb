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

  describe 'database_url' do
    it 'should return a value if DATABASE_URL is set' do
      var = 'DATABASE_URL'
      url = 'postgres://'
      ENV.stub(:[]).with(var) { url }
      Pagerage::Config.database_url.should eq(url)
    end

    it 'should return a sane value if DATABASE_URL is not set' do
      Pagerage::Config.database_url.should eq('postgres://localhost/pagerage')
    end
  end

  describe 'pagerduty_base_url' do
    it 'should return it if it is set' do
      var = 'PAGERDUTY_BASE_URL'
      url = 'https://foo.pagerduty.com/api/v1'
      ENV.stub(:[]).with(var) { url }
      Pagerage::Config.pagerduty_base_url.should eq(url)
    end
  end
end
