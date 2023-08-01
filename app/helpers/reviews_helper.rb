module ReviewsHelper

  def calculate_width(object, rating)
    total_reviews_size = object.reviews.size
    reviews_count = object.reviews.where(stars: rating).count
    ratings_percentage = (reviews_count.to_f / total_reviews_size) * 100

    # "total reviews: #{total_reviews_size} reviews count: #{reviews_count} ratings percentage: #{ratings_percentage}"
    if total_reviews_size.zero?
      "width: 0%"
    else 
      "width: #{ratings_percentage}%"
    end
  end 

  def reviews_percentage(object, rating)
    total_reviews_size = object.reviews.size
    reviews_count = object.reviews.where(stars: rating).count
    ratings_percentage = reviews_count.to_f / total_reviews_size * 100
    
    if total_reviews_size.zero?
      "0%"
    else 
      "#{ratings_percentage.to_i}%"
    end
  end 

end
