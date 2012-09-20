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
  end
end
