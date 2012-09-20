require 'spec_helper'

describe PagerRage::Incident do
  let(:incident_json) { File.read(File.dirname(__FILE__) + '/incident_sample.json') }                                                
  let(:incident_data) { JSON.parse(incident_json) }                                   

  before(:each) do 
    PagerRage::Incident.destroy
  end

  describe 'creation' do
    it 'should return an Incident' do
      PagerRage::Incident.create(:data => incident_data).should be_kind_of(PagerRage::Incident)
    end

    it 'should increase the count' do
      PagerRage::Incident.create(:data => incident_data)
      PagerRage::Incident.count.should eq(1)
    end

    it 'should require data' do
      lambda { PagerRage::Incident.create }.should raise_error(Sequel::ValidationFailed)
    end
  end

  describe 'parsing data' do
    let(:incident_json) { File.read(File.dirname(__FILE__) + '/incident_sample.json') }
    let(:incident_data) { JSON.parse(incident_json) }
    let(:incident) { PagerRage::Incident.create(:data => incident_data) }

    it 'should be okay after parsing the sample' do
      incident.should be_kind_of(PagerRage::Incident)
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
end
