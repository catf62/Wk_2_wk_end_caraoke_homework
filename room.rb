class Room

  attr_reader :room_number, :room_capacity, :room_booking_name, :room_play_list

  def initialize(room_number, room_capacity)
    @room_number = room_number
    @room_capacity = room_capacity
    @room_booking_name = "Not booked"
    @room_play_list = []
  end

end
