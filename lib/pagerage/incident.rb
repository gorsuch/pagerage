module Pagerage
  class Incident < Sequel::Model
    plugin :serialization, :json, :data
    plugin :validation_helpers

    def self.latest
      order(:pagerduty_created_on).last
    end

    def before_validation
      self.incident_number = self.data['incident_number']
      self.pagerduty_created_on = self.data['created_on']
      if self.data['trigger_summary_data']
        self.subject = self.data['trigger_summary_data']['subject']
      end
      self.service_name = self.data['service']['name']
      super
    end

    def validate
      super
      validates_presence [:data]
      validates_unique :incident_number
    end 
  end
end
