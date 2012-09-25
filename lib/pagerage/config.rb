module Pagerage
  module Config
    extend self

    def database_url
      ENV['DATABASE_URL'] || 'postgres://localhost/pagerage'
    end

    def env!(key)
      ENV[key] || raise("#{key} not defined in ENV")
    end

    def pagerduty_base_url
      env!('PAGERDUTY_BASE_URL')
    end
  end
end
