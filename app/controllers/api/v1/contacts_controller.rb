class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  def index
    @contacts = current_user.contacts
                            .order(name: :asc)
                            .page(params[:page])
    render json: @contacts
  end

  def show
    render json: @contact, status: :ok
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      render json: @contact, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    head :no_content
  end

  def search
    binding.pry
    query = params[:query]
    @contacts = current_user.contacts.where('name LIKE ? OR cpf LIKE ?', "%#{query}%", "%#{query}%").order(name: :asc)
    render json: @contacts
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :cpf, :phone, :address, :complement, :zip_code, :latitude, :longitude)
  end
end
