class AddDefaultAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :avatar, :string, default: 'dhh.jpeg'
  end
end
