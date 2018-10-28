require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class GuestTest < MiniTest::Test

  def setup ()
    @song1 = Song.new("Don't stop believin'", "Journey")
    @song2 = Song.new("Don't stop me now", "Queen")
    @guest1 = Guest.new("Babs", "Smith", 50, @song1)
    @guest2 = Guest.new("Ben", "No booking", 100, @song2)
    @guest3 = Guest.new("Peggy", "Smith", 3, [])
    @room1 = Room.new(1,8)

  end

  def test_add_room_to_guest
    @guest1.add_room_to_guest(@room1)
  assert_equal(@room1, @guest1.guest_room)
  end

  def test_guest_has_guest_name
    assert_equal("Peggy", @guest3.guest_name)
  end

  def test_guest_has_booking
    assert_equal("Smith", @guest1.booking_name)
  end

  def test_guest_purse_contents
    assert_equal(100, @guest2.guest_purse)
  end

  def test_guest_pay_for_room__guest_has_enough
    assert_equal(95, @guest2.guest_pay_for_room(@room1))
  end

  def test_guest_has_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_guest_can_play_favourite_song__song_availabe
    @guest1.add_room_to_guest(@room1)
    @room1.add_song_to_playlist(@song1)
    assert_equal("I'm playing my favourite song!", @guest1.play_favourite_song)
  end

  def test_guest_can_play_favourite_song__song_not_available
    @guest1.add_room_to_guest(@room1)
    assert_equal("Aww my favourite song's not here!", @guest1.play_favourite_song)
  end

end
