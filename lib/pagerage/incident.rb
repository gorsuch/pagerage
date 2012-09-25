module Pagerage
  class Incident < Sequel::Model
    plugin :serialization, :json, :data
    plugin :validation_helpers

    def self.latest
      order(:pagerduty_created_on).last
    end

    def before_validation
      data = self.data
      if data
        self.incident_number = data['incident_number']
        self.pagerduty_created_on = data['created_on']
        if data['trigger_summary_data']
          self.subject = data['trigger_summary_data']['subject'] || data['trigger_summary_data']['description']
        else
          self.subject = data['incident_key']
	end
        self.service_name = data['service']['name']
      end
      super
    end

    def validate
      super
      validates_presence [:data]
      validates_unique :incident_number
    end 
  end
end
