class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :firstname
      t.string :lastname
      t.string :firm
      t.decimal :cost
      t.string :description
      t.string :age

      t.timestamps null: false
    end
  end
end
