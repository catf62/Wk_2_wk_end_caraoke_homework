require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup()
    @room1 = Room.new(1, 8)
    @room2 = Room.new(2, 8)
    @room3 = Room.new(3, 8)
    @room4 = Room.new(4, 12)
    @song4 = Song.new("Burning Love", "Elvis")
    @guest1 = Guest.new("Babs", "Smith")
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

  def test_change_booking_name
    @room1.change_booking_name("Smith")
    assert_equal("Smith", @room1.room_booking_name)
  end

  def test_add_song_to_playlist
    @room3.add_song_to_playlist(@song4)
    assert_equal([@song4], @room3.room_play_list)
  end

  def test_check_no_guests_in_room
    assert_equal([], @room3.guests_in_room)
  end

  # def test_check_guest_into_room
  #   @room3.check_guest_into_room(@guest1)
  #   assert_equal(1, @room3.guests_in_room)
  # end

  def test_number_of_guests_in_room
    assert_equal(0, @room1.number_of_guests_in_room)
  end

end
