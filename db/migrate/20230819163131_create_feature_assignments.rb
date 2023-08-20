class CreateFeatureAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_assignments do |t|
      t.references :chair, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
