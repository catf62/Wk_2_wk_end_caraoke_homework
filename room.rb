class Room

  attr_reader :room_number, :room_capacity, :room_booking_name, :room_play_list

  def initialize(room_number, room_capacity)
    @room_number = room_number
    @room_capacity = room_capacity
    @room_booking_name = "Not booked"
    @room_play_list = []
  end

  def change_booking_name(new_name)
    @room_booking_name = new_name
  end

  def add_song_to_playlist(song)
    @room_play_list<<song
  end

end
