require 'test_helper'

class PoemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:john)
    @poem = poems(:one)
  end

  test "should get index" do
    get poems_url
    assert_response :success
  end

  test "should get new" do
    get new_poem_url
    assert_response :success
  end

  test "should create poem" do
    assert_difference('Poem.count') do
      post poems_url, params: { poem: {title:"new title",
                                content: "this is content", 
                                author: "noone" } }
    end

    assert_response :success
    assert_equal("noone", JSON.parse(response.body)["author"], "author is not noone")
  end

  test "should show poem" do
    get poem_url(@poem)
    assert_response :success
  end

  test "should get edit" do
    get edit_poem_url(@poem)
    assert_response :success
  end

  test "should update poem" do
    patch poem_url(@poem), params: { poem: {title: "new_title"} }
    assert_redirected_to poem_url(@poem)
  end

  test "should destroy poem" do
    assert_difference('Poem.count', -1) do
      delete poem_url(@poem)
    end

    assert_redirected_to poems_url
  end

   test "should not show poem if unauthorized" do
    @poem = poems(:two)
    get poem_url(@poem)
    assert_response 401
  end

  test "should not get edit if unauthorized" do
    @poem = poems(:two)
    get edit_poem_url(@poem)
    assert_response 401
  end

  test "should not update poem if unauthorized" do
    @poem = poems(:two)
    patch poem_url(@poem), params: { poem: {title: "new_title"} }
    assert_response 401
  end

  test "should not destroy poem if unauthorized" do
    @poem = poems(:two)
    delete poem_url(@poem)
    assert_response 401
  end

end
