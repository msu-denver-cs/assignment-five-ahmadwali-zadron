require 'test_helper'
#require 'cars_controller'
# comment
# another comment1

class CarsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  fixtures :cars
  include Devise::TestHelpers
  setup do
    @car = cars(:one)
    sign_in users(:one)
    # @controller = CarsController.new
    # @request = ActionController::TestRequest.new
    # @response = ActionController::TestRequest.new
  end

=begin
  def test_search_car
    get :search, :make => 'Toyota'
    assert_not_nil assigns(:car)

  end
=end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { Vin: @car.Vin, make: @car.make, model: @car.model } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { Vin: @car.Vin, make: @car.make, model: @car.model } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
