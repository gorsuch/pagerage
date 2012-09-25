require 'spec_helper'
require 'rack/test'

require 'pagerage/web'

describe Pagerage::Web do
  include Rack::Test::Methods

  def app
    Pagerage::Web
  end

  describe 'GET /health' do
    it 'should respond with a 200' do
      get '/health'
      last_response.should be_ok
    end

    it 'should respond with "OK"' do
      get '/health'
      last_response.body.should eq('OK')
    end
  end
end
