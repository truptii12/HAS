class AddPnumberToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :pnumber, :string
  end
end
