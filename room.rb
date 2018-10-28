require_relative('guest')
class Room

  attr_reader :room_number, :room_capacity, :room_booking_name, :room_play_list, :guests_in_room, :room_kitty, :room_price

  def initialize(room_number, room_capacity)
    @room_number = room_number
    @room_capacity = room_capacity
    @room_booking_name = "Not booked"
    @room_play_list = []
    @guests_in_room = []
    @room_kitty = 0
    @room_price = 5
  end

  def change_booking_name(new_name)
    @room_booking_name = new_name
  end

  def add_song_to_playlist(song)
    @room_play_list << song
  end

  def number_of_guests_in_room
    @guests_in_room.count
  end

  def check_guest_into_room(guest)
    @guests_in_room << guest
  end

  def chuck_guest_out_of_room(guest)
    @guests_in_room.delete(guest)
  end

  def guest_can_be_added_to_room(guest)
    if @guests_in_room.count >= @room_capacity
      return "No space!"
    else
      return "Come on in!"
    end
  end

  def take_payment_for_room
  @room_kitty  += @room_price
  end

  def is_song_in_playlist(song)
    if @room_play_list.include?(song)
      return true
    else
      return false
    end
  end

  def play_song(song)
    if is_song_in_playlist(song) == true
      return "Playing song!"
    else
      return "Sorry, this room doesn't have that song!"
    end
  end





end
