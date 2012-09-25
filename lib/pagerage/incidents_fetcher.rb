module Pagerage
  class IncidentsFetcher
    attr_reader :pagerduty_base_url

    def initialize(opts={})
      @pagerduty_base_url = opts[:pagerduty_base_url] || Pagerage::Config.pagerduty_base_url
    end

    def fetch
      since = (Time.now - 24*60*60).iso8601
      now = Time.now.iso8601
      RestClient.get("#{pagerduty_base_url}/incidents", {:params => {:since => since, :until => now}, :accept => :json}).body
    end
  end
end
