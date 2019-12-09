class Flightoffering < ActiveRecord::Base
#augment default destroy behavior to remove all bookings under this flight.
   before_destroy :remove_existing_bookings

   def remove_existing_bookings
    @bookings = Booking.where(flightofferings_id: id)
    @bookings.each do |booking|
        booking.delete
    end
   end
end