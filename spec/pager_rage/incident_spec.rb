require 'spec_helper'

describe PagerRage::Incident do
  before(:each) do 
    PagerRage::Incident.destroy
  end

  describe 'creation' do
    it 'should return an Incident' do
      PagerRage::Incident.create(:data => {}).should be_kind_of(PagerRage::Incident)
    end

    it 'should increase the count' do
      PagerRage::Incident.create(:data => {})
      PagerRage::Incident.count.should eq(1)
    end

    it 'should require data' do
      lambda { PagerRage::Incident.create }.should raise_error(Sequel::ValidationFailed)
    end
  end

  describe 'parsing data' do
    let(:incident_json) { File.read(File.dirname(__FILE__) + '/incident_sample.json') }
    let(:incident_data) { JSON.parse(incident_json) }

    it 'should be okay after parsing the sample' do
      PagerRage::Incident.create(:data => incident_data).should be_kind_of(PagerRage::Incident)
    end
  end
end
