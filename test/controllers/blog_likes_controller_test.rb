require 'test_helper'

class BlogLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get blog_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_likes_destroy_url
    assert_response :success
  end

end
