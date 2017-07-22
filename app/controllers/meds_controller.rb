class MedsController < ApplicationController
  require 'med_decorator'
  before_action :set_med, only: [:show, :edit, :update, :destroy]

  # GET /meds
  # GET /meds.json
  def index
    @meds = Med.all
    @meds = Med.search(params[:search])
  end

  # GET /meds/1
  # GET /meds/1.json
  def show
  end

  # GET /meds/new
  def new
    @med = Med.new
  end

  # GET /meds/1/edit
  def edit
  end

  # POST /meds
  # POST /meds.json
def create
@med = Med.new()
@med.firstname = params[:med][:firstname]
@med.lastname = params[:med][:lastname]
@med.cost = params[:med][:cost]
# create an instance/object of a BasicMed
myMed = BasicMed.new(15, @med.firstname, @med.lastname)
# add the extra features to the new med
if params[:med][:windows].to_s.length > 0 then
myMed = ElectricWindowsDecorator.new(myMed)
end

## populate the cost and the description details
@med.cost = myMed.cost
@med.description = myMed.details
respond_to do |format|
if @med.save
format.html { redirect_to @med, notice: 'Med was successfully created.'}
format.json { render :show, status: :created, location: @med }
else
format.html { render :new }
format.json { render json: @med.errors, status: :unprocessable_entity }
end
end
end
  # PATCH/PUT /meds/1
  # PATCH/PUT /meds/1.json
  def update
    respond_to do |format|
      if @med.update(med_params)
        format.html { redirect_to @med, notice: 'Med was successfully updated.' }
        format.json { render :show, status: :ok, location: @med }
      else
        format.html { render :edit }
        format.json { render json: @med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meds/1
  # DELETE /meds/1.json
  def destroy
    @med.destroy
    respond_to do |format|
      format.html { redirect_to meds_url, notice: 'Med was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_med
      @med = Med.find(params[:id])
    end

    # Never trust parameters from the smedy internet, only allow the white list through.
    def med_params
      params.require(:med).permit(:firstname, :lastname, :cost)
    end
end
