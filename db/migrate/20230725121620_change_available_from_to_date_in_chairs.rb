class ChangeAvailableFromToDateInChairs < ActiveRecord::Migration[7.0]
  def change
    change_column :chairs, :available_from, :date
  end
end
