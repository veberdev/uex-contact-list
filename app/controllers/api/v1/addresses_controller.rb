class Api::V1::AddressesController < ApplicationController
  def search_by_cep
    address = ViaCepService.get_address(params[:cep])
    if address['error']
      render json: { error: address['error'] }, status: :not_found
    else
      render json: address
    end
  end
end
