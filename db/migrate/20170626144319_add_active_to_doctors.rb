class AddActiveToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :active, :boolean
  end
end
