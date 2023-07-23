class AddFieldsToChairs < ActiveRecord::Migration[7.0]
  def change
    add_column :chairs, :company, :string
    add_column :chairs, :available_from, :datetime
  end
end
