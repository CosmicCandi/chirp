require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "the truth" do
    assert true
  end

  test "should get index" do
    get photos_url, as: :json
    assert_response :success
  end


end
