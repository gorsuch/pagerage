require 'spec_helper'

describe Pagerage::IncidentsFetcher do
  describe 'initialize' do
    it 'should be initialized without argument if PAGERDUTY_BASE_URL is set' do
      ENV.stub(:[]).with('PAGERDUTY_BASE_URL') { 'https://foo.com' }
      Pagerage::IncidentsFetcher.new.should be_kind_of(Pagerage::IncidentsFetcher)
    end

    it 'should take an optional hash that includes pagerduty_base_url' do
      Pagerage::IncidentsFetcher.new({:pagerduty_base_url => 'https://foo.com'}).should be_kind_of(Pagerage::IncidentsFetcher)
    end

    it 'should explode upon not getting a url' do
      ENV.stub(:[]).with('PAGERDUTY_BASE_URL') { nil }
      lambda { Pagerage::IncidentsFetcher.new({}) }.should raise_error
    end
  end

  describe 'fetch' do
    let(:base_url) { 'https://test.pagerduty.com/api/v1' }
    let(:fetcher) { Pagerage::IncidentsFetcher.new({:pagerduty_base_url => base_url}) }
    let(:now) { Time.now }
    let(:since) { Time.now - 24*60*60 }

    it 'should contact the incidents api endpoint' do
      Timecop.freeze(now) do
        stub = stub_request(:get, "#{base_url}/incidents").with(:query => {'since' => since.iso8601, 'until' => now.iso8601}).to_return(:body => {}.to_json)
        fetcher.fetch
        stub.should have_been_requested
      end
    end

    it 'should return return a JSON body' do
      Timecop.freeze(now) do
        stub = stub_request(:get, "#{base_url}/incidents").with(:query => {'since' => since.iso8601, 'until' => now.iso8601}).to_return(:body => {'a' => 'b'}.to_json)
	fetcher.fetch.should eq({'a' => 'b'}.to_json)
      end
    end
  end
end
