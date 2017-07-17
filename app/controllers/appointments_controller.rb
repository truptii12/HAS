class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
 # before_filter :isAvailable, :only => :create
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # GET /appointments
  # GET /appointments.json
   def isAvailable
             redirect_to doctor_appointment_path(@doctor,@appointment)
   end
  
  def index
  #  @appointments = Appointment.all
    @doctor = Doctor.find(params[:doctor_id])
    @appointments = @doctor.appointments
    if params[:search]
      @appointment= Appointment.search(params[:search]).order("created_at DESC")
    else
      @appointment= Appointment.all.order('created_at DESC')
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
   @doctor = Doctor.find(params[:doctor_id])
   @appointment = @doctor.appointments.find(params[:id])
  end

  # GET /appointments/new
  def new
    # respond_to do |format|
 #  if(!self.isAvailable)
  @doctor = Doctor.find(params[:doctor_id])
  @appointment = @doctor.appointments.build
#end
    #@appointment = Appointment.new
  #  else
      #format.html { redirect_to @appointment, notice: 'Appointment was successfully_created.' }
       # format.json { render :show, status: :created, location: @appointment }
       #  format.html { render :new }
        #  format.json { render json: @appointment.errors, status: :unprocessable_entity }
   # end
  end

  # GET /appointments/1/edit
  def edit
    @doctor = Doctor.find(params[:doctor_id])
# For URL like /movies/1/reviews/2/edit
# Get review id=2 for movie 1
@appointment = @doctor.appointments.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
   #@doctor = Doctor.find(params[:doctor_id])
  # @appointment = @doctor.appointments.build(params.require(:appointment).permit(:startTime, :comment, :patient_id, :doctor_id))
   # @appointment = Appointment.new(appointment_params)
   #@appointment.startTime = params[:appointment][:startTime]
   #@appointment.comment = params[:appointment][:comment]
  #  @appointment.patient_id = params[:appointment][:patient_id]
   #@doctor_id1 = params[:appointment][:doctor_id]
  #@appointment.appointmentdate = params[:appointment][:appointmentdate]
    @doctor = Doctor.find(params[:doctor_id])
   @appointment = @doctor.appointments.build(params.require(:appointment).permit(:appointmentdate, :startTime, :comment, :patient_id, :doctor_id))
     #respond_to do |format|
      #  @appointments_list = Appointment.all
      
      @appointment.patientname=current_user.email
        
        
      if @appointment.save
       # format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        #format.json { render :show, status: :created, location: @appointment }
        redirect_to doctor_appointment_path(@doctor, @appointment)
      else
   
        # format.html { render :isAvailable }
        render 'new'
      end
        
                                          
  end
  


  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.find(params[:id])
    
   if @appointment.update_attributes(params.require(:appointment).permit(:appointmentdate, :startTime, :comment, :patient_id, :doctor_id))
    # Save the review successfully
    redirect_to doctor_appointment_path(@doctor, @appointment)
   else  
      render :action => "edit"
   end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
  #@doctor = Doctor.find(params[:doctor_id])
   @appointment = Appointment.find(params[:id])
   @appointment.destroy
   respond_to do |format|
    format.html { redirect_to doctors_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      #@appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:appointmentdate, :startTime, :comment, :patient_id, :doctor_id)
    end
end

