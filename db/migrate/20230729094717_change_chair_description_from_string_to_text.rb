class ChangeChairDescriptionFromStringToText < ActiveRecord::Migration[7.0]
  def change
      change_column :chairs, :description, :text
  end
end
