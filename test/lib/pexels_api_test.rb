require 'test_helper'

class PexelsApiTest < ActiveSupport::TestCase
  setup do
    pexels_api_mock
  end

  test "should return file path string" do
    response = PexelsApi.get_sample_image('test')

    assert_equal('mock.image.path', response);
  end
end
