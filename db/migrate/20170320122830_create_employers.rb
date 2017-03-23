class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.date :dateofbirth
      t.boolean :gender
      t.string :location
      t.string :phone

      t.timestamps null: false
    end
  end
end
