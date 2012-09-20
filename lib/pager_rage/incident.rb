module PagerRage
  class Incident < Sequel::Model
    plugin :validation_helpers

    def validate
      super
      validates_presence [:data]
    end 
  end
end
