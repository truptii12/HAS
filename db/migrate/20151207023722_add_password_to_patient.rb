class AddPasswordToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :password, :string
  end
end
