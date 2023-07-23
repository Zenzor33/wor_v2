class CreateChairs < ActiveRecord::Migration[7.0]
  def change
    create_table :chairs do |t|
      t.string :name
      t.decimal :price
      t.string :country
      t.string :city
      t.string :picture

      t.timestamps
    end
  end
end
