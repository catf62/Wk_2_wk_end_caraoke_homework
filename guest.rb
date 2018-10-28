require_relative('room')
class Guest

  attr_reader :guest_name, :booking_name, :guest_purse, :favourite_song, :guest_room

  def initialize (guest_name, booking_name, guest_purse, favourite_song)
    @guest_name = guest_name
    @booking_name = booking_name
    @guest_purse = guest_purse
    @favourite_song = favourite_song
    @guest_room = nil
  end

  def guest_pay_for_room(room)
    if @guest_purse >= room.room_price
      @guest_purse -= room.room_price
    else
      return "You don't have enough to pay for that!"
    end
  end

  def add_room_to_guest(room)
    if guest_pay_for_room(room) == "You don't have enough to pay for that!"
      return "You don't have enough to pay for that, and we're not letting you in!"
    else
      @guest_room = room
    end
  end



  def play_favourite_song
    if @guest_room.play_song(@favourite_song) == "Playing song!"
      return "I'm playing my favourite song!"
    else
      return "Aww my favourite song's not here!"
    end
  end

end
