require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Don't stop believin'", "Journey")
    @song2 = Song.new("Don't stop me now", "Queen")
    @song4 = Song.new("Burning Love", "Elvis")
    @room1 = Room.new(1, 8)
    @room2 = Room.new(2, 8)
    @room3 = Room.new(3, 8)
    @room4 = Room.new(4, 12)
    @guest1 = Guest.new("Babs", "Smith", 50, @song1)
    @guest2 = Guest.new("Mandy", "Guiness", 50, @song2)
    @guest3 = Guest.new("Jimmy", "Guiness", 2, [])
    @guest4 = Guest.new("Lauren", "Bucket", 100, [])
    @guest5 = Guest.new("Mike", "Spoon", 5, [])
    @guest6 = Guest.new("Grumpy", "Bear", 1, @song2)
    @guest7 = Guest.new("June", "Smith", 200, @song2)
    @guest8 = Guest.new("Pip", "Scunner", 10, @song1)
    @guest9 = Guest.new("Barry", "No booking", 3, [])

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

  def test_number_of_guests_in_room
    assert_equal(0, @room1.number_of_guests_in_room)
  end

  def test_check_guest_into_room__1_guest
    @room3.check_guest_into_room(@guest1)
    assert_equal(1, @room3.number_of_guests_in_room)
  end

  def test_check_guest_into_room__2_guests
    @room3.check_guest_into_room(@guest1)
    @room3.check_guest_into_room(@guest2)
    assert_equal(2, @room3.number_of_guests_in_room)
  end

  def test_chuck_guest_out_of_room__0_guests_left_after
    @room3.check_guest_into_room(@guest1)
    @room3.chuck_guest_out_of_room(@guest1)
    assert_equal(0, @room3.number_of_guests_in_room)
  end

  def test_chuck_guest_out_of_room__1_guest_left_after
    @room3.check_guest_into_room(@guest1)
    @room3.check_guest_into_room(@guest2)
    @room3.chuck_guest_out_of_room(@guest1)
    assert_equal(1, @room3.number_of_guests_in_room)
  end

  ################# Extensions #############
  def test_guest_can_be_added__room_full
    @room3.check_guest_into_room(@guest1)
    @room3.check_guest_into_room(@guest2)
    @room3.check_guest_into_room(@guest3)
    @room3.check_guest_into_room(@guest4)
    @room3.check_guest_into_room(@guest5)
    @room3.check_guest_into_room(@guest6)
    @room3.check_guest_into_room(@guest7)
    @room3.check_guest_into_room(@guest8)
    @room3.guest_can_be_added_to_room(@guest9)
    assert_equal("No space!", @room3.guest_can_be_added_to_room(@guest9))
  end

  def test_guest_can_be_added__space_in_room
    @room3.check_guest_into_room(@guest1)
    @room3.check_guest_into_room(@guest2)
    @room3.check_guest_into_room(@guest3)
    @room3.check_guest_into_room(@guest4)
    @room3.check_guest_into_room(@guest5)
    @room3.check_guest_into_room(@guest6)
    @room3.check_guest_into_room(@guest7)
    @room3.guest_can_be_added_to_room(@guest9)
    assert_equal("Come on in!", @room3.guest_can_be_added_to_room(@guest9))
  end

  def test_room_kitty_starts_at_0
    assert_equal(0,@room1.room_kitty)
  end

  def test_room_has_price
    assert_equal(5, @room3.room_price)
  end

  def test_take_payment_for_room
    @room3.take_payment_for_room
    assert_equal(5, @room3.room_kitty)
  end

  def test_is_song_in_playlist__song_not_there
    assert_equal(false, @room1.is_song_in_playlist(@song1))
  end

  def test_is_song_in_playlist__song_in_playlist
    @room1.add_song_to_playlist(@song1)
    assert_equal(true, @room1.is_song_in_playlist(@song1))
  end

  def test_play_song__song_not_there
    assert_equal("Sorry, this room doesn't have that song!", @room1.play_song(@song1))
  end

  def test_play_song__song_is_there
    @room1.add_song_to_playlist(@song1)
    assert_equal("Playing song!", @room1.play_song(@song1))
  end


end
