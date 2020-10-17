class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @numClients = Client.count()
    @numDrivers = Driver.count()
    @numServices = Service.count()
    @numVehicles = Vehicle.count()
  end
end
