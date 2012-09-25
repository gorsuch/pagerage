require 'sinatra/base'

module Pagerage
  class Web < Sinatra::Base
    get '/' do
      Incident.all
      haml :index
    end

    get '/health' do
      'OK'
    end
  end
end
