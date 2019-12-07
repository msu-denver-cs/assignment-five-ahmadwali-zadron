class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  autocomplete :car, :name, full_search: true

  # GET /cars
  # GET /cars.json

  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show


  end

  #commented
  # GET /cars/new
  def new
    @car = Car.new
    @parts = Part.all
  end

  # GET /cars/1/edit
  def edit
    @parts = Part.all
  end

  # GET /cars/search?query
  def search
    @cars = Car.where("model like ? or make like ? or vin like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    #@cars = Car.where("make like ?", "%#{params[:search]}%")
    #@cars = Car.where("vin like ?", "%#{params[:search]}%")
    render :index

  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:make, :model, :Vin, :part_ids => [] )
    end

def car_params
  params.require(:car).permit(:make, :model, :Vin)
end

end


