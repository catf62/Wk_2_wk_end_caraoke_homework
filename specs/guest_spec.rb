require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup ()
    @guest1 = Guest.new("Babs", "Smith")
    @guest2 = Guest.new("Ben", "No booking")
    @guest3 = Guest.new("Peggy", "Smith")
  end

  def test_guest_has_guest_name
    assert_equal("Peggy", @guest3.guest_name)
  end

  def test_guest_has_booking
    assert_equal("Smith", @guest1.booking_name)
  end

end
