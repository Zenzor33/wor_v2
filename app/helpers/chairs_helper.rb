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

    def label_classes 
        # py-2 not tailwind
        "block text-sm font-medium leading-6 text-gray-900 py-2"
    end 

    def form_field_classes
        "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
    end
end
