require 'sinatra/base'

module Pagerage
  class Web < Sinatra::Base
    get '/' do
    end

    get '/health' do
      'OK'
    end
  end
end
