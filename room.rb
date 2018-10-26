class Room

  attr_reader :room_number, :room_capacity, :room_booking_name, :room_play_list, :guests_in_room

  def initialize(room_number, room_capacity)
    @room_number = room_number
    @room_capacity = room_capacity
    @room_booking_name = "Not booked"
    @room_play_list = []
    @guests_in_room = []
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

end
