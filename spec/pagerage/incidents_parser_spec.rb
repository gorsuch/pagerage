require 'spec_helper'

describe Pagerage::IncidentsParser do
  before(:each) do
    Pagerage::Incident.delete
  end
  let(:incidents_json) { File.read(File.dirname(__FILE__) + '/incidents_sample.json') }
  let(:incidents_data) { JSON.parse(incidents_json) }
  let(:parser) { Pagerage::IncidentsParser.new(incidents_json) }

  it 'should set data attr when created' do
    parser.data.should eq(incidents_data)
  end

  it 'should generate two incidents from the sample data' do
    parser.run!
    Pagerage::Incident.count.should eq(2)
  end
end
