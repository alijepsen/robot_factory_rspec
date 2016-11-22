class CreateInventors < ActiveRecord::Migration[5.0]
  def change
    create_table :inventors do |t|
      t.string :name
      t.integer :age
      t.date :hire_date
      t.string :speciality

      t.timestamps
    end
  end
end
