class AddUserIdToChairs < ActiveRecord::Migration[7.0]
  def change
    add_reference :chairs, :user, foreign_key: true
  end
end
