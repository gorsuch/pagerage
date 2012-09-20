require 'spec_helper'

describe PagerRage::IncidentsParser do
  let(:incidents_json) { File.read(File.dirname(__FILE__) + '/incidents_sample.json') }
  let(:incidents_data) { JSON.parse(incidents_json) }
  let(:parser) { PagerRage::IncidentsParser.new(incidents_json) }

  it 'should set data attr when created' do
    parser.data.should eq(incidents_data)
  end

  it 'should generate two incidents from the sample data' do
    2.times { PagerRage::Incident.should_receive(:create) }
    parser.generate_incidents!
  end
end
