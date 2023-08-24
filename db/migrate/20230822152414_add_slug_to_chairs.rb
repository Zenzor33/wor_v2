class AddSlugToChairs < ActiveRecord::Migration[7.0]
  def change
    add_column :chairs, :slug, :string
  end
end
