require 'test_helper'

class Api::V1::PoemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:john)
    token = Doorkeeper::AccessToken.new(resource_owner_id: user.id)
    ApplicationController.any_instance.stubs(:doorkeeper_token).returns(token)
  end

  test "should return success for index" do
    get "/api/v1/poems.json"
    assert_response :success
  end

  test "should return success for show" do
    get "/api/v1/poems/1.json"
    assert_response :success
  end

  test "should not return success if unauthorized" do
    get "/api/v1/poems/2.json"
    assert_response 401
  end

  test "should return success for create" do
    assert_difference('Poem.count') do
      post "/api/v1/poems.json", params: {poem: {title: "hello", content: "world", author:"anon"}}
      assert_response :success
    end
  end

  test "should return success for update" do
    put "/api/v1/poems/1.json", params: {poem: {title: "poem title"}}
    assert_response :success
    assert_equal "poem title" , Poem.find(1).title 
  end

  test "should not return success for update if unauthorized" do
    put "/api/v1/poems/2.json", params: {poem: {title: "poem title"}}
    assert_response 401
  end

  test "should return success for delete" do
    assert_difference('Poem.count', -1) do
      delete "/api/v1/poems/1.json"
      assert_response :success
    end
  end  
  
  test "should not return success for delete if unauthorized" do
    delete "/api/v1/poems/2.json"
    assert_response 401
  end
end
