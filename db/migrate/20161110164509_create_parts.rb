class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :number
      t.belongs_to :robot, foreign_key: true

      t.timestamps
    end
  end
end
