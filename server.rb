require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'curb'

class App < Sinatra::Base

  set :apikey, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  set :courier, 'jne'
  set :format, 'json'

  get '/' do
    'Ongkir.info through sinatra application'
  end

  get '/city' do
    content_type :json
    
    params = request.env['rack.request.query_hash']
    query = params['query']
    type = params['type']

    url = 'http://api.ongkir.info/city/list'
    c = Curl::Easy.http_post(url,
                            Curl::PostField.content('query', query),
                            Curl::PostField.content('type', type),
                            Curl::PostField.content('courier', settings.courier),
                            Curl::PostField.content('API-Key', settings.apikey),
                            Curl::PostField.content('format', settings.format))

    c.body_str

  end

  get '/cost' do
    content_type :json

    params = request.env['rack.request.query_hash']
    from = params['from']
    to = params['to']
    weight = params['weight']

    url = 'http://api.ongkir.info/cost/find' 
    c = Curl::Easy.http_post(url,
                            Curl::PostField.content('from', from),
                            Curl::PostField.content('to', to),
                            Curl::PostField.content('weight', weight),
                            Curl::PostField.content('courier', settings.courier),
                            Curl::PostField.content('API-Key', settings.apikey),
                            Curl::PostField.content('format', settings.format))
  
    c.body_str

  end

end
