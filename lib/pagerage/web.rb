require 'sinatra/base'

module Pagerage
  class Web < Sinatra::Base
    get '/health' do
      'OK'
    end
  end
end
