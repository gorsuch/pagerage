module Pagerage
  class IncidentsFetcher
    attr_reader :pagerduty_base_url

    def initialize(opts={})
      @pagerduty_base_url = opts[:pagerduty_base_url] 
    end
  end
end
