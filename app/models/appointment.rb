class Appointment < ActiveRecord::Base
 #attr_accessible :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor
  validates :appointmentdate, uniqueness: {scope: [:startTime,:doctor_id] , 
     message: ->(object, data) do
        "Hey select another appointment date "
      end
      
  }
  
 # validates :uniqueness_of_fields

#private # optionnal
#def uniqueness_of_fields
#  if self.class.exists?(start_time: self[:start_time], appointmentdate: self[:appointmentdate])
 #   self.errors.add(:start_time, "Combination #{self[:start_time]} and #{self[:appointmentdate]} already existings!")
   # logger :do_your_thing # here is where you want to log stuff
 #   return false
 # else
 #   return true # validation passes, is unique
 # end
#end
  
 before_create:isAvailable
  after_create :reminder
 
 def isAvailable
     @appointments_list = Appointment.all
    @appointments_list.each do |appointment|
      if((appointment.appointmentdate == 'self.appointmentdate') && (appointment.doctor_id== 'self.doctor_id')) 
         puts " Duration clash*** "
         raise "Duration clash *****"
      end
   end
 end
  
  @@REMINDER_TIME = 60.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
    @twilio_number = ['0899836680']
    @number_to_send_to=['0894535936']
    twilio_sid = "AC5750c4d4c59bd4812dc58faefb829e9e"
    twilio_token = "96aa06990b3ad02fa0a7cc1c0e0cf8a0"
   # @client = Twilio::REST::Client.new ENV['AC25d1eab9c54f98e27b49e76145798780'], ENV['a10f83dc36e85901005966cc2d8c7c81']
   # time_str = ((self.startTime).localtime).strftime("%I:%M%p on %b. %d, %Y")
   # reminder = "Hi . Just a reminder that you have an appointment coming up at #{time_str}."
   # message = @client.accounts.messages.create(
   #      :from => @twilio_number,
   #   :to => self.pnumber,
   #   :body => reminder,
   # )
    
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 time_str = ((self.startTime).localtime).strftime("%I:%M%p on %b. %d, %Y")
@twilio_client.messages.create(
  :from => "+353861802892",
  :to =>  "+353894535936",
  :body => "Hi . You have appointment at #{time_str}"
)

    #puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end
 
 def self.search(search)
     where("comments LIKE ?", "%#{search}%")
  end
# handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

end
