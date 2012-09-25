module Pagerage
  class Incidentinator
    attr_reader :fetcher

    def initialize
      @fetcher = IncidentsFetcher.new(:pagerduty_base_url => Config.pagerduty_base_url)
    end

    def run
      json = fetcher.fetch
      parser = IncidentsParser.new(json)
      parser.run!
    end
  end
end
