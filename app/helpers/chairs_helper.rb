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

    def calculate_width(object, rating)
        total_reviews_size = object.reviews.size
        reviews_count = object.reviews.where(stars: rating).count
        ratings_percentage = reviews_count / total_reviews_size
    
        if total_reviews_size.zero?
          "width: 0%"
        else 
          "width: calc(#{ratings_percentage} * 100%)"
        end
      end 
    
      def reviews_percentage(object, rating)
        total_reviews_size = object.reviews.size
        reviews_count = object.reviews.where(stars: rating).count
        ratings_percentage = reviews_count / total_reviews_size
        
        if total_reviews_size.zero?
          "0%"
        else 
          "#{ratings_percentage}%"
        end
      end 

end
