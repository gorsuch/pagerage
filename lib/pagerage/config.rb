module Pagerage
  module Config
    extend self

    def env!(key)
      ENV[key] || raise("#{key} not defined in ENV")
    end

    def pagerduty_base_url
      env!('PAGERDUTY_BASE_URL')
    end
  end
end
