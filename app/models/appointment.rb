class Appointment < ActiveRecord::Base
 #attr_accessible :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor
  
  before_create:isAvailable
  
 
 def isAvailable
     @appointments_list = Appointment.all
    @appointments_list.each do |appointment|
      if((appointment.appointmentdate == 'self.appointmentdate') && (appointment.doctor_id== 'self.doctor_id')) 
         puts " Duration clash*** "
         raise "Duration clash *****"
      end
   end
 end
  
end
