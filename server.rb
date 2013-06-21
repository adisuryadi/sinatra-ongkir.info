require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'httparty'

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

    options = { :body => {
        "query" => query,
        "type" => type,
        "courier" => settings.courier,
        "API-Key" => settings.apikey,
        "format" => settings.format
      }
    }
    response = HTTParty.post(url, options)
    response.body
  end

  get '/cost' do
    content_type :json

    params = request.env['rack.request.query_hash']
    from = params['from']
    to = params['to']
    weight = params['weight']
    url = 'http://api.ongkir.info/cost/find'

    options = { :body => {
        "from" => from,
        "to" => to,
        "weight" => weight,
        "courier" => settings.courier,
        "API-Key" => settings.apikey,
        "format" => settings.format
      }
    }
    response = HTTParty.post(url, options)
    response.body
  end
end
