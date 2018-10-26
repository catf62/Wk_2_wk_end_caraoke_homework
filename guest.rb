class Guest

  attr_reader :guest_name, :booking_name

  def initialize (guest_name, booking_name)
    @guest_name = guest_name
    @booking_name = booking_name
  end

end
