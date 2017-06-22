class AddNpiToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :NPI, :integer
  end
end
