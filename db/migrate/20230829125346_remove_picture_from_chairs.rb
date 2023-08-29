class RemovePictureFromChairs < ActiveRecord::Migration[7.0]
  def change
    remove_column :chairs, :picture, :string
  end
end
