class AddDefaultPictureToChairs < ActiveRecord::Migration[7.0]
  def change
    change_column :chairs, :picture, :string, default: "placeholder_chair.jpg"
  end
end
