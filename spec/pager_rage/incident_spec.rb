require 'spec_helper'

describe PagerRage::Incident do
  before(:each) do 
    PagerRage::Incident.destroy
  end

  it 'should be createable' do
    PagerRage::Incident.create(:data => {}).should be_kind_of(PagerRage::Incident)
  end
end
