module ReviewsHelper

  def get_ratings_percentage(object, rating)
    total_reviews_count = object.reviews.count
    matching_ratings_count = object.reviews.where(stars: rating).count
    ratings_percentage = matching_ratings_count.to_f / total_reviews_count * 100
  end 

  def calculate_width(object, rating)
    "width: #{get_ratings_percentage(object, rating).to_i}%"
  end 

  def reviews_percentage(object, rating)
    "#{get_ratings_percentage(object, rating).to_i}%"
  end 

end
