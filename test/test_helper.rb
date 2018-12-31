ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def pexels_api_mock
    file_response_path = File.expand_path('../fixtures/files/pexel_api_response.txt', __FILE__)

    mock = File.read(file_response_path);

    stub_request(:any, /api\.pexels\.com/).
      to_return(body: JSON.parse(mock), status: 200)
  end
end
