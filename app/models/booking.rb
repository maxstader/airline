class Booking < ActiveRecord::Base
    validate :validate_flight_availability

    def validate_flight_availability
        if (Flightoffering.find(flightofferings_id).passenger_capacity -  Booking.where(flightofferings_id: flightofferings_id).length) < 1 
            errors.add(:flightofferings_id, 'No availability on flight')
        end
    end    
end
