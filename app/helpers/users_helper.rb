module UsersHelper
  def avatar(user)
    if user.avatar.attached?
      image_tag user.avatar
        #.variant(resize_to_limit: [300, 300])
    else
      image_tag "dhh.jpg"
    end
  end
end
