class AddNullFalseToUserIdInChairs < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chairs, :user_id, false
  end
end
