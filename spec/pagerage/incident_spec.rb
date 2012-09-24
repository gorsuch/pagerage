require 'spec_helper'

describe Pagerage::Incident do
  let(:incident_json) { File.read(File.dirname(__FILE__) + '/incident_sample.json') }                                                
  let(:incident_data) { JSON.parse(incident_json) }                                   
  let(:incident) { Pagerage::Incident.create(:data => incident_data) }

  before(:each) do 
    Pagerage::Incident.destroy
  end

  describe 'creation' do
    it 'should return an Incident' do
      Pagerage::Incident.create(:data => incident_data).should be_kind_of(Pagerage::Incident)
    end

    it 'should increase the count' do
      Pagerage::Incident.create(:data => incident_data)
      Pagerage::Incident.count.should eq(1)
    end

    it 'should require data' do
      lambda { Pagerage::Incident.create }.should raise_error(Sequel::ValidationFailed)
    end
  end

  describe 'parsing data' do
    it 'should be okay after parsing the sample' do
      incident.should be_kind_of(Pagerage::Incident)
    end

    it 'should set incident_number' do
      incident.incident_number.should eq(1)
    end

    it 'should set pagerduty_created_on' do
      incident.pagerduty_created_on.should eq DateTime.parse(incident_data['created_on'])
    end
 
    it 'should set subject' do
      incident.subject.should eq(incident_data['trigger_summary_data']['subject'])
    end

    it 'should set service_name' do
      incident.service_name.should eq(incident_data['service']['name'])
    end
  end

  it 'should responsd to latest' do
    incident
    Pagerage::Incident.latest.should eq(incident)
  end
end
