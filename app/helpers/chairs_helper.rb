module ChairsHelper

    def isPast?(datetime)
        datetime < Time.now
    end 

    def display_availability(chair)
        if chair.available_from.nil?
            "Availability not specified"
        elsif (isPast?(chair.available_from))
            "Available Now!"
        else  
            "Available from #{chair.available_from.strftime('%Y-%m-%d')}"
        end
    end 
end
