class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  
  # GET /services/new
  def new
    @service = Service.new
    drivers_for_select
    clients_for_select
    vehicles_for_select
    @service.build_address

  end

  # GET /services/1/edit
  def edit
    drivers_for_select
    clients_for_select
    vehicles_for_select
  end


  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    drivers_for_select
    clients_for_select
    vehicles_for_select

    respond_to do |format|
      
      @address = Address.new(address_params)
      if @address.save
        @service.address_id = @address.id
        if @service.save
          format.html { redirect_to @service, notice: 'Service was successfully created.' }
          format.json { render :show, status: :created, location: @service }
        else
          format.html { render :new }
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def drivers_for_select
    @driver_drivers_for_select = Driver.all
  end

  def clients_for_select
    @client_clients_for_select = Client.all
  end

  def vehicles_for_select
    @vehicle_vehicles_for_select = Vehicle.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:status, :price, :data, :address_id, :driver_id, :client_id, :vehicle_id)
    end

    def address_params
      params.require(:service).permit(:street, :neighborhood, :zipcode, :number, :city)
    end
end
