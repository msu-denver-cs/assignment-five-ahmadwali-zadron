require_relative "test_helper"
require "test/unit"

class CarTest < ActiveSupport::TestCase
  fixtures :cars

   # test "the truth" do
   #   assert true
   # end

   def test_car
     new_car = Car.new :make => cars(:new_car).make,
                       :model => cars(:new_car).model,
                       :Vin => cars(:new_car).Vin,
                       :created_at => cars(:new_car).created_at
     assert new_car.save

   end

=begin
  def test_typecheck
    assert_raise( RuntimeError ) { Car.new('a')}
  end

  def test_failure
    asser_equal()
  end
=end
end
