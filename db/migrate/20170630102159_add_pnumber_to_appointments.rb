class AddPnumberToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :pnumber, :string
  end
end
