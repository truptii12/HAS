class UpdateUsers < ActiveRecord::Migration
  def change
    @u= User.find_by(email :'kulkarni.trupti.v.19@gmail.com')
    @u.update_attribute :admin,true
  end
end
