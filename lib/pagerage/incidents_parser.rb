module Pagerage
  class IncidentsParser
    attr_reader :data

    def initialize(json)
      @data = JSON.parse(json)
    end

    def generate_incidents!
      data['incidents'].each do |i|
        Incident.create(:data => i)
      end      
    end
  end
end
