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

    def form_input_classes 
        "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
    end

    def form_field_with_error_classes
        "mt-2 text-sm text-red-600"
    end

    def form_field_button_classes
        "rounded-md bg-indigo-600 px-2.5 py-1.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 mt-2" 
    end

    def nav_link_url(scope)
        current_page?(filtered_chairs_path(scope)) ? chairs_url : filtered_chairs_path(scope)
    end
    

    def user_likes_chair?(user, chair)
        user && chair.likers.exists?(id: user.id)
    end 

end
