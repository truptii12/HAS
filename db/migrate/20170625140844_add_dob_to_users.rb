class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime
     add_column :users, :address, :string
  end
end
