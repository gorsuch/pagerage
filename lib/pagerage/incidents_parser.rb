module Pagerage
  class IncidentsParser
    attr_reader :data

    def initialize(json)
      @data = JSON.parse(json)
    end

    def run!
      count = 0
      Incident.db.transaction do
        data['incidents'].each do |i|
          n = Incident.new(:data => i)
	  if n.valid?
            n.save
	    count += 1
	  end
        end      
      end
      count
    end
  end
end
