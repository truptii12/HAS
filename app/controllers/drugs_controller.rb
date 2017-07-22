class DrugsController < ApplicationController
  require 'drug_decorator'
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  # GET /drugs
  # GET /drugs.json
def index
  @drugs = Drug.all
  if params[:search]
    @drugs = Drug.search(params[:search]).order("created_at DESC")
  else
    @drugs = Drug.all.order('created_at DESC')
  end
end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
  end

  # GET /drugs/new
  def new
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
def create
@drug = Drug.new()
@drug.firstname = params[:drug][:firstname]
@drug.lastname = params[:drug][:lastname]
@drug.age = params[:drug][:age]
@drug.firm = params[:drug][:firm]
# create an instance/object of a BasicDrug
myDrug = BasicDrug.new(2, @drug.firm, @drug.age)
# add the extra features to the new drug
if params[:drug][:windows].to_s.length > 0 then
myDrug = ElectricWindowsDecorator.new(myDrug)
end

if params[:drug][:panadols].to_s.length > 0 then
myDrug = PanadolsDecorator.new(myDrug)
end

## populate the cost and the description details
@drug.cost = myDrug.cost
@drug.description = myDrug.details
respond_to do |format|
if @drug.save
format.html { redirect_to @drug, notice: 'Order placed for drug successfully.'}
format.json { render :show, status: :created, location: @drug }
else
format.html { render :new }
format.json { render json: @drug.errors, status: :unprocessable_entity }
end
end
end
  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the sdrugy internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:firstname, :lastname, :firm, :cost, :description, :age)
    end
end
