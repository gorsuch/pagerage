require 'timecop'
require 'webmock/rspec'

require 'pagerage'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.around(:each) do |example|
    DB.transaction(:rollback=>:always) {example.run}
  end
end
