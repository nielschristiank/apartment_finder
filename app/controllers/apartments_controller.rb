class ApartmentsController < ApplicationController

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
      # repsond with new apartment
    if apartment.valid? # check is apartment exists
      render json: apartment
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  def show
    apartment = Apartment.find_by(id:params[:id])
    render json: apartment
  end

  def update
    apartment = Apartment.find_by(id:params[:id])
    apartment.update(apartment_params)
    render json: apartment
  end

  def destroy
    apartment = Apartment.find_by(id:params[:id])
    apartment.destroy
  end

  def apartment_params
    params.require(:apartment).permit(:address_1, :address_2, :city, :postal_code, :state, :country, :building_manager_name, :building_manager_phone, :building_manager_hours)
  end


end
