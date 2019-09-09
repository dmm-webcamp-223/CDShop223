require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get songs_destroy_url
    assert_response :success
  end

end
