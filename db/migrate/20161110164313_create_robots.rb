class CreateRobots < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :serial_number
      t.boolean :evil
      t.string :color
      t.string :industry
      t.belongs_to :inventor, foreign_key: true

      t.timestamps
    end
  end
end
