require 'test_helper'

class MakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @make = makes(:one)
  end

  test "should get index" do
    get makes_url
    assert_response :success
  end

  test "should get new" do
    get new_make_url
    assert_response :success
  end

  test "should create make" do
    assert_difference('Make.count') do
      post makes_url, params: { make: { Country: @make.Country, name: @make.name } }
    end

    assert_redirected_to make_url(Make.last)
  end

  test "should show make" do
    get make_url(@make)
    assert_response :success
  end

  test "should get edit" do
    get edit_make_url(@make)
    assert_response :success
  end

  test "should update make" do
    patch make_url(@make), params: { make: { Country: @make.Country, name: @make.name } }
    assert_redirected_to make_url(@make)
  end

  test "should destroy make" do
    assert_difference('Make.count', -1) do
      delete make_url(@make)
    end

    assert_redirected_to makes_url
  end
end
