require 'sinatra/base'

module Pagerage
  class Web < Sinatra::Base
    get '/' do
      haml :index, :locals => { :incidents => Incident.order(Sequel.desc(:pagerduty_created_on)) }
    end

    get '/health' do
      'OK'
    end
  end
end
