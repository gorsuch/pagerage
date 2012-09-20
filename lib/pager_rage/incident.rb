module PagerRage
  class Incident < Sequel::Model
    plugin :serialization, :json, :data
    plugin :validation_helpers

    def before_save
      self.incident_number = self.data['incident_number']
      super
    end

    def validate
      super
      validates_presence [:data]
    end 
  end
end
