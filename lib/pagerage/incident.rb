module Pagerage
  class Incident < Sequel::Model
    plugin :serialization, :json, :data
    plugin :validation_helpers

    def self.latest
      order(:pagerduty_created_on).last
    end

    def before_save
      self.incident_number = self.data['incident_number']
      self.pagerduty_created_on = self.data['created_on']
      self.subject = self.data['trigger_summary_data']['subject']
      self.service_name = self.data['service']['name']
      super
    end

    def validate
      super
      validates_presence [:data]
    end 
  end
end
