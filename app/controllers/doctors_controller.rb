class DoctorsController < ApplicationController
  before_filter :set_doctor, only: [:show, :edit, :update, :destroy]
 #before_filter :authenticate_user!
 #validates :dname, presence: true
 #validates :email, presence: true
 # validates :contact, length: { is: 10}
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # GET /doctors
  # GET /doctors.json
  def index
    
    @doctors = Doctor.all
  end

  def doctors_list
  
    
    @doctors = Doctor.all
  end
  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
   #  before_filter :authenticate_user, :only => [:account_settings, :set_account_info]
    @doctor = Doctor.new
  end
    def content
      @doctor= Doctor.paginate(:page => params[:page], :per_page => 12)
      respond_to do |format|
        format.html # content.html.erb
      end
    end  
  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
   # @doctor = Doctor.new(doctor_params)
   @doctor = Doctor.new()
        @doctor.dname = params[:doctor][:dname]
@doctor.email = params[:doctor][:email]
@doctor.default_appoinment_duration = params[:doctor][:default_appoinment_duration]
@doctor.speciality = params[:doctor][:speciality]
@doctor.contact = params[:doctor][:contact]

    respond_to do |format|
      if @doctor.save
        generated_password = Devise.friendly_token.first(8)
        @password=@doctor.contact
       # logger = Logger.new("password"+@password)
       # puts "password"+@password
        
        User.create!({:email => @doctor.email, :role => "doctor", :password => @password, :password_confirmation => @password })
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
         
        format.json { render :show, status: :created, location: @doctor }
        WelcomeMail.welcome_doctor(@user, @password).deliver
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:dname, :email, :default_appoinment_duration,:speciality)
    end
end
