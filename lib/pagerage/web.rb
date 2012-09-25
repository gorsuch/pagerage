require 'sinatra/base'

module Pagerage
  class Web < Sinatra::Base
    get '/' do
      haml :index, :locals => { :incidents => Incident.all }
    end

    get '/health' do
      'OK'
    end
  end
end
