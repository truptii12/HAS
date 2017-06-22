class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :dname
      t.string :email
      t.integer :default_appoinment_duration

      t.timestamps null: false
    end
  end
end
