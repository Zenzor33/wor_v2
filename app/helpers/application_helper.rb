module ApplicationHelper

    def isPast?(datetime)
        datetime < Time.now
    end 

    def display_availability(obj)
        if obj.available_from.nil?
            "Availability date not specified"
        # if available, display "Available Now"
        elsif (isPast?(obj.available_from))
            "Available Now!"
        # else, display "Available from [date]"
        else  
            "Available from #{obj.available_from.strftime('%Y-%m-%d')}"
        end
    end 
end
