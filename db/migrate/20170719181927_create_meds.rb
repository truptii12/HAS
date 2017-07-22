class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :firstname
      t.string :lastname
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
