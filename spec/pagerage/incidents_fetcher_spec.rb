require 'spec_helper'

describe Pagerage::IncidentsFetcher do
  describe 'initialize' do
    it 'should be initialized without argument' do
      Pagerage::IncidentsFetcher.new.should be_kind_of(Pagerage::IncidentsFetcher)
    end

    it 'should take an optional hash' do
      Pagerage::IncidentsFetcher.new({}).should be_kind_of(Pagerage::IncidentsFetcher)
    end
  end
end
