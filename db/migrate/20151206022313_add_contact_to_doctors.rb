class AddContactToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :contact, :integer
  end
end
