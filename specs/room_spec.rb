require('minitest/autorun')
require('minitest/rg')
require_relative('../room')

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new(1, 8)
    @room2 = Room.new(2, 8)
    @room3 = Room.new(3, 8)
    @room4 = Room.new(4, 12)
  end

  def test_room_has_room_number
    assert_equal(3, @room3.room_number)
  end

  def test_room_has_room_capacity
    assert_equal(8, @room2.room_capacity)
  end

  def test_room_starts_off_not_booked
    assert_equal("Not booked", @room4.room_booking_name)
  end

  def test_room_play_list_starts_off_empty
    assert_equal([], @room1.room_play_list)
  end

end
