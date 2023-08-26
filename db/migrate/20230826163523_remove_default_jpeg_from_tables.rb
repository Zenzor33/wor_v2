class RemoveDefaultJpegFromTables < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:chairs, :picture, nil)
    change_column_default(:users, :avatar, nil)
  end
end
