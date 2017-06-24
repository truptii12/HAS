class Doctor < ActiveRecord::Base
    #attr_accessible :name
    has_many :appointments
  has_many :patients, through: :appointments
    after_create :send_welcome_email
    
    def send_welcome_email
      puts "Hello Doctor Welcome to the Panel"
       WelcomeMail.welcome_email(self).deliver_now
    end
end
