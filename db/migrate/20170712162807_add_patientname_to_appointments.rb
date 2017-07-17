class AddPatientnameToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :patientname, :string
  end
end
