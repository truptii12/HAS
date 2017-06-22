class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.date :BOB

      t.timestamps null: false
    end
  end
end
