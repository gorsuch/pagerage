module Pagerage
  module Config
    extend self

    def env!(key)
      ENV[key] || raise("#{key} not defined in ENV")
    end
  end
end
