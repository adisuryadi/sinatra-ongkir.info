require File.expand_path('../testhelper', __FILE__)
require 'test/unit'
require 'rack/test'

set :environment, :test

class CostTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_it_shows_403_error_if_being_access_without_query_strings
    browser = Rack::Test::Session.new(Rack::MockSession.new(App))
    browser.get '/cost'
    assert_equal 403, browser.last_response.status, 'Response status should be 403'
  end
end

