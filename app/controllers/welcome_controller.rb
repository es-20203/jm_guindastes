class WelcomeController < ApplicationController
  def index
    parameter = params[:id]
    @services = nil
    @notice = ""

    if !parameter.nil?
      client_id = Client.where(cpf_cnpj: parameter).first
      if !client_id.nil?
        @services = Service.where(client_id: client_id)
      else
        @notice = "Client not found."
      end
    end
  end
end