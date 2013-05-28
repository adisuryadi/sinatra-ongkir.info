require File.expand_path('../testhelper', __FILE__)
require 'test/unit'
require 'rack/test'

set :environment, :test

class HomepageTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_it_shows_the_homepage
    browser = Rack::Test::Session.new(Rack::MockSession.new(App))
    browser.get '/'
    assert browser.last_response.ok?, 'Response should be ok'
  end
end

